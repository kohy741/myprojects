using System.Collections;
using System.Collections.Generic;
using UnityEngine;
public class normalvector : MonoBehaviour
{    
    public Material metal; // index 5
    public Material brightstone; //index 6
    public Material darkstone; //index 7
    public Material yellowguide;
    public Material greenguide;
    private int index;
    int primitiveIndex;
    int MaterialIndex;
    RaycastHit guide;
    GameObject guideblock;
    GameObject block;

    private void OnEnable()
    {
        BasicUImanager.OnPrimitiveChange += Primitive_Change;
        BasicUImanager.OnMaterialChange += Material_Change;
    }
    private void OnDisable()
    {
        BasicUImanager.OnPrimitiveChange -= Primitive_Change;
        BasicUImanager.OnMaterialChange -= Material_Change;
    }
    private void Primitive_Change(int index) 
    {
        primitiveIndex = index;
        guideblock = GameObject.CreatePrimitive((PrimitiveType)primitiveIndex);        
        Destroy(guideblock.GetComponent<Collider>());
        guideblock.GetComponent<Renderer>().material = yellowguide;
        guideblock.transform.position = new Vector3(0, -1f, 0);  //hide it under the base
    }
    private void Material_Change(int index)
    {
        MaterialIndex = index;
    }    
    void Update()
    {
        if (Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out guide))
        {
            #region guide
            if (guide.transform.tag.Equals("Base"))
            {
                guideblock.transform.position = new Vector3(guide.point.x, guide.point.y + (0.5f), guide.point.z);
                guideblock.GetComponent<Renderer>().material = yellowguide;
            }
            else
            {
                guideblock.transform.position = guide.transform.position + (guide.normal);
                guideblock.transform.rotation = Quaternion.LookRotation(guide.normal, Vector3.up);
                guideblock.GetComponent<Renderer>().material = greenguide;
            }
        }
        else
        {
            guideblock.transform.position = new Vector3(0, -1f, 0);//just hide it under the base until the mouse cursor gets one the base. with this, the trail problem was resolved.  
            #endregion
        }
        if (Input.GetMouseButtonUp(0))
        {
            #region Create
            RaycastHit hitInfo = new RaycastHit();
            bool hit = Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out hitInfo);
            if (hit)
            {
                block = GameObject.CreatePrimitive((PrimitiveType)primitiveIndex);
                block.name = string.Format("Block{0}", index.ToString());
                index += 1;
                block.tag = "Blocks";

                if (MaterialIndex == 5) block.GetComponent<Renderer>().material = metal;
                else if (MaterialIndex == 6) block.GetComponent<Renderer>().material = brightstone;
                else if (MaterialIndex == 7) block.GetComponent<Renderer>().material = darkstone;

                if (hitInfo.transform.tag.Equals("Base"))
                {
                    block.transform.position = new Vector3(hitInfo.point.x, hitInfo.point.y + (0.5f), hitInfo.point.z);
                }
                else
                {  
                    block.transform.position = hitInfo.transform.position + (hitInfo.normal);
                    block.transform.rotation = Quaternion.LookRotation(hitInfo.normal, Vector3.up);
                }
            }

            #endregion            
        }
        if (Input.GetMouseButtonUp(1))
        {
            #region destroy
            RaycastHit Right_Click_hitInfo = new RaycastHit();
            if (Physics.Raycast(Camera.main.ScreenPointToRay(Input.mousePosition), out Right_Click_hitInfo))
            {
                if (Right_Click_hitInfo.transform.tag.Equals("Blocks"))
                {
                    Right_Click_hitInfo.collider.gameObject.AddComponent<TriangleExplosion>();
                    StartCoroutine(Right_Click_hitInfo.collider.gameObject.GetComponent<TriangleExplosion>().SplitMesh(true));
                }
            }
            #endregion
        }
    }
}

