#include <Arduino_FreeRTOS.h>
#include <task.h>
#include <semphr.h>
#define RED_PIN_1 7
#define YELLOW_PIN_1 6
#define GREEN_PIN_1 4 
#define RED_PIN_2 5
#define YELLOW_PIN_2 8
#define GREEN_PIN_2 3
#define BUTTON_PIN 2 
volatile int buttonFlag;
int lastButtonState = 1;
long unsigned int lastPress;
int debounceTime = 20;
TaskHandle_t task1Handle;   //create handles for task1
// Define the delay times for the traffic light phases
#define PHASE_1_DELAY 3000  // Green light for street 1
#define PHASE_2_DELAY 1000  // Yellow light for street 1
#define PHASE_3_DELAY 1500  // Red light for street 1, green light for street 2
#define PHASE_4_DELAY 1000  // Yellow light for street 2

// Declare the semaphore to prioritize the narrow street
SemaphoreHandle_t mySemaphore;

void Main_trafficlight_task(void* pvParameters) {
  while (1) {
      
      // Wait for the semaphore to be released
      xSemaphoreTake(mySemaphore, portMAX_DELAY);
      Serial.println("Main_trafficlight_task is working");

      // Phase 1: Green light for street 1
      digitalWrite(GREEN_PIN_1, HIGH);
      digitalWrite(RED_PIN_2, HIGH);
      vTaskDelay(pdMS_TO_TICKS(PHASE_1_DELAY));

      //Release the semaphore
      xSemaphoreGive(mySemaphore);
      delay(100);      
  }
}

void Sub_trafficlight_task(void* pvParameters) {
  while (1) {
    // Wait for the semaphore to be released
      xSemaphoreTake(mySemaphore, portMAX_DELAY);
      Serial.println("Sub_trafficlight_task is working");
    
      // Reset all the lights
      digitalWrite(GREEN_PIN_1, LOW);
      digitalWrite(YELLOW_PIN_1, LOW);
      digitalWrite(RED_PIN_1, LOW);
      digitalWrite(GREEN_PIN_2, LOW);
      digitalWrite(YELLOW_PIN_2, LOW);
      digitalWrite(RED_PIN_2, LOW);

      // Phase 2: Yellow light for street 1
      digitalWrite(YELLOW_PIN_1, HIGH);
      digitalWrite(RED_PIN_2, HIGH);
      vTaskDelay(pdMS_TO_TICKS(PHASE_2_DELAY));

      // Phase 3: Red light for street 1, green light for street 2
      digitalWrite(YELLOW_PIN_1, LOW);
      digitalWrite(RED_PIN_1, HIGH);
      digitalWrite(RED_PIN_2, LOW);
      digitalWrite(GREEN_PIN_2, HIGH);
      vTaskDelay(pdMS_TO_TICKS(PHASE_3_DELAY));

      // Phase 4: Yellow light for street 2
      digitalWrite(GREEN_PIN_2, LOW);
      digitalWrite(YELLOW_PIN_2, HIGH);
      vTaskDelay(pdMS_TO_TICKS(PHASE_4_DELAY));
     
      // Reset all the lights
      digitalWrite(GREEN_PIN_1, LOW);
      digitalWrite(YELLOW_PIN_1, LOW);
      digitalWrite(RED_PIN_1, LOW);
      digitalWrite(GREEN_PIN_2, LOW);
      digitalWrite(YELLOW_PIN_2, LOW);
      digitalWrite(RED_PIN_2, LOW);    
          
      // Release the semaphore
      xSemaphoreGive(mySemaphore);
      delay(200);
  }
}
// Task function for the button control
void buttonTask(void* pvParameters) {
  while(1){
    
    if((millis() - lastPress) > debounceTime && buttonFlag)
    {
      lastPress = millis();
      if(digitalRead(BUTTON_PIN) == 0 && lastButtonState == 1)
      {
        lastButtonState = 0;
        Serial.println("pressed");        
      }
      else if(digitalRead(BUTTON_PIN) == 1 && lastButtonState == 0)
      {
        lastButtonState = 1;
      }
      buttonFlag = 0;        
    }
  }
}

void setup() {
  Serial.begin(9600);
  pinMode(RED_PIN_1, OUTPUT);
  pinMode(YELLOW_PIN_1, OUTPUT);
  pinMode(GREEN_PIN_1, OUTPUT);
  pinMode(RED_PIN_2, OUTPUT);
  pinMode(YELLOW_PIN_2, OUTPUT);
  pinMode(GREEN_PIN_2, OUTPUT);
  pinMode(BUTTON_PIN, INPUT);

  attachInterrupt(digitalPinToInterrupt (BUTTON_PIN),ISR_button , CHANGE); 

  // Initialize the semaphore with a count of 1
  mySemaphore = xSemaphoreCreateCounting(1, 1);

  // Create the tasks
  xTaskCreate(Main_trafficlight_task, "Main_trafficlight_task", 128, NULL, 0, NULL);
  xTaskCreate(Sub_trafficlight_task, "Sub_trafficlight_task", 128, NULL,1, NULL);
  xTaskCreate(buttonTask, "buttonTask", 128, NULL, 0, NULL);

  // Start the scheduler
  vTaskStartScheduler();
}
void ISR_button()
{
  Serial.println("interrupt occured!!!");
  buttonFlag = 1;
  BaseType_t xHigherPriorityTaskWoken = pdFALSE;        
  vTaskSuspend(task1Handle); // suspend task1  
  xSemaphoreGiveFromISR(mySemaphore, &xHigherPriorityTaskWoken);
  if (xHigherPriorityTaskWoken) {
    portYIELD_FROM_ISR();    
  }
}
void loop() {
  // Nothing to do here
}