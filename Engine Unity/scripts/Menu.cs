using UnityEngine;
using UnityEngine.SceneManagement;
using System.Collections;

public class Menu : MonoBehaviour {
	
	public GameObject menu_btn_pressed;

	public void OnMouseDown () {

		menu_btn_pressed.SetActive(true);
		
		StartCoroutine(Wait(0.13f));
	}
	
	private IEnumerator Wait(float seconds) {
		
		yield return new WaitForSeconds(0.13f);

		SceneManager.LoadScene("menu",LoadSceneMode.Single);

    }
}