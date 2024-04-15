using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class BasicUImanager : MonoBehaviour
{    
    public delegate void PrimitiveChange(int index);
    public static event PrimitiveChange OnPrimitiveChange;

    public delegate void MaterialChange(int index);
    public static event MaterialChange OnMaterialChange;

    void Start() {  }

    void Update() {  }

    public void ButtonClick(int index)
    {
        //Debug.Log($"You clicked the Primative select button with the index value of {index}");
        OnPrimitiveChange?.Invoke(index);
    }
    public void ButtonClick2(int index)
    {
        //Debug.Log($"You clicked the Material select button with the index value of {index}");
        OnMaterialChange?.Invoke(index);
    }    
}
