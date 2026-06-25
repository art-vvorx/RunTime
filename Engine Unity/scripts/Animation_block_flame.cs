using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Animation_block_flame : MonoBehaviour {
	public Sprite[] sprites;
	private float frameRate = 0.12f;

	private SpriteRenderer sr;
	private int index = 0;

	void Start() {
		sr = GetComponent<SpriteRenderer>();
		InvokeRepeating(nameof(SwitchSprite), frameRate, frameRate);
	}

	void SwitchSprite() {
		if (sprites.Length == 0) return;
		index = (index + 1) % sprites.Length;
		sr.sprite = sprites[index];
	}
}
