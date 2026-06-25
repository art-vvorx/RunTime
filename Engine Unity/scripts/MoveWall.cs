using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MoveWall : MonoBehaviour {
	
	private GameObject wall;
	private float Speed = 5f;

	void Update() {
		transform.position -= new Vector3 (0, Speed * Time.deltaTime, 0); 
	}

	void FixedUpdate() {
		if (transform.position.y <= -26.0f) {
			transform.position = new Vector2(0.0f, transform.position.y + 56.0f);
		}
	}

}
