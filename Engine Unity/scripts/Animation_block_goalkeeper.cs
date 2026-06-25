using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Animation_block_goalkeeper : MonoBehaviour {

	private float speed = 50f;
 	private float minimum = -20f;
	private float maximum = 20f;

	void Update() {
		transform.eulerAngles = new Vector3(transform.rotation.x, transform.rotation.y, Mathf.PingPong(Time.time*speed, maximum-minimum)+minimum);
	}
	
}
