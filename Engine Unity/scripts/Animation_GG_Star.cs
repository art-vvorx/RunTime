using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Animation_GG_Star : MonoBehaviour {
	
	private float speed = 150f;
    
    void Update() {
		
		transform.eulerAngles -= new Vector3(0, 0, speed * Time.deltaTime);
        
    }
}
