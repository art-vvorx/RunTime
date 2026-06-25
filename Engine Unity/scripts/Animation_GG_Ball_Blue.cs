using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Animation_GG_Ball_Blue : MonoBehaviour {
	
	private float speed = 0.7f;
 	private float minimum = 0.30f;
	private float maximum = 0.55f;
	
	void Update() {
		
		transform.localScale = new Vector2(transform.localScale.x, Mathf.PingPong(Time.time*speed, maximum-minimum)+minimum);
		
	}	
}
