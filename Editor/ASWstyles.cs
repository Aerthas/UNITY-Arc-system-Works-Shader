using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using System.IO;

// help link https://docs.unity3d.com/ScriptReference/EditorStyles.html
[InitializeOnLoad]
public class ASWStyles : MonoBehaviour
{

    private static bool foldoutClicked = false;

    public static bool DoFoldout(Dictionary<Material, ASWToggles> foldouts, Material mat, MaterialEditor me, string header){
        foldouts[mat].SetState(header, Foldout(header, foldouts[mat].GetState(header), me));
        return foldouts[mat].GetState(header);
    }

    public static bool DoMediumFoldout(Dictionary<Material, ASWToggles> foldouts, Material mat, MaterialEditor me, MaterialProperty prop, string header, Color color){
        foldouts[mat].SetState(header, MediumFoldout(header, foldouts[mat].GetState(header), me, color));
        me.ShaderProperty(prop, " ");
        GUILayout.Space(4);
        return foldouts[mat].GetState(header);
    }

    public static bool DoMediumFoldout(Dictionary<Material, ASWToggles> foldouts, Material mat, MaterialEditor me, string header, Color color){
        foldouts[mat].SetState(header, MediumFoldout(header, foldouts[mat].GetState(header), me, color));
        GUILayout.Space(24);
        return foldouts[mat].GetState(header);
    }

    public static float GetInspectorWidth(){
        EditorGUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        EditorGUILayout.EndHorizontal();
        return GUILayoutUtility.GetLastRect().width;
    }

    public static float GetPropertyWidth(){
        float lw = EditorGUIUtility.labelWidth;
        float iw = GetInspectorWidth();
        return iw - lw;
    }

    public static bool SimpleButton(string text, float width, float xPos){
        Rect buttonRect = EditorGUILayout.GetControlRect();
        buttonRect.width = width;
        buttonRect.x += xPos;
        return GUI.Button(buttonRect, text);
    }

    // Replace invalid windows characters with underscores
    public static string ReplaceInvalidChars(string filename) {
        string updated = string.Join("_", filename.Split(Path.GetInvalidFileNameChars())); 
        updated = updated.Replace(" ", "_");
        if (updated == "")
            updated = "_";
        return updated;
    }

    public static bool FoldoutToggle(Rect rect, Event evt, bool mouseOver, bool display, int size){

        float space = 0;
        float offset = 0;
        switch (size){
            case 0: 
                offset = 4f;
                space = -2f;
                break;
            case 1: 
                offset = 2f;
                space = -22f; 
                break;
            case 2: 
                space = -18f; 
                break;
            default: break;
        }

        Rect arrowRect = new Rect(rect.x+offset, rect.y+offset, 0f, 0f);
        switch(evt.type){

            case EventType.Repaint:
                EditorStyles.foldout.Draw(arrowRect, false, false, display, false);
                break;

            case EventType.MouseUp:
                if (mouseOver){
                    display = !display;
                    foldoutClicked = false;
                    evt.Use();
                }
                break;

            case EventType.DragUpdated:
                if (mouseOver && !display){
                    display = true;
                    evt.Use();
                }
                break;

            default: break;
        }
        GUILayout.Space(space);
        return display;
    }
    
    //Header Centered
    private static Rect DrawShurikenCenteredTitle(string title, Vector2 contentOffset, int HeaderHeight)
    {
        var style = new GUIStyle("ShurikenModuleTitle");
        style.font = new GUIStyle(EditorStyles.boldLabel).font;
        style.border = new RectOffset(15, 7, 4, 4);
        style.fixedHeight = HeaderHeight;
        style.contentOffset = contentOffset;
        style.alignment = TextAnchor.MiddleCenter;
        //var rect = GUILayoutUtility.GetRect(16f, HeaderHeight, style);
		var rect = GUILayoutUtility.GetRect(GetInspectorWidth(), style.fixedHeight, style);

        GUI.Box(rect, title, style);
        return rect;
    }
	private static Rect DrawShurikenCenteredTitle(string title){
		GUIStyle formatting = new GUIStyle("ShurikenModuleTitle");
        formatting.font = new GUIStyle(EditorStyles.boldLabel).font;
        formatting.contentOffset = new Vector2(0f, -3f);
        formatting.hover.textColor = Color.gray;
        formatting.fixedHeight = 28f;
        formatting.fontSize = 10;
		
        formatting.alignment = TextAnchor.MiddleCenter;
		Rect rect = GUILayoutUtility.GetRect(GetInspectorWidth(), formatting.fixedHeight, formatting);
        rect.width += 8f;
        rect.x -= 8f;

        Event evt = Event.current;
        Color bgCol = GUI.backgroundColor;
		GUI.Box(rect, title, formatting);
		
		return rect;
	}
	public static void ShurikenHeaderCentered(string title)
    {
        DrawShurikenCenteredTitle(title);
    }
    //End Header Centered

    //Foldout
    public static bool Foldout(string header, bool display, MaterialEditor me){
        GUIStyle formatting = new GUIStyle("ShurikenModuleTitle");
        formatting.font = new GUIStyle(EditorStyles.boldLabel).font;
        formatting.contentOffset = new Vector2(20f, -3f);
        formatting.hover.textColor = Color.gray;
        formatting.fixedHeight = 28f;
        formatting.fontSize = 10;

        Rect rect = GUILayoutUtility.GetRect(GetInspectorWidth(), formatting.fixedHeight, formatting);
        rect.width += 8f;
        rect.x -= 8f;

        Event evt = Event.current;
        Color bgCol = GUI.backgroundColor;
        bool mouseOver = rect.Contains(evt.mousePosition);

        if (evt.type == EventType.MouseDown && mouseOver){
            foldoutClicked = true;
            evt.Use();
        }
            
        else if (evt.type == EventType.Repaint && foldoutClicked && mouseOver){
            GUI.backgroundColor = Color.gray;
            me.Repaint();
        }
        
        GUI.Box(rect, header, formatting);
        GUI.backgroundColor = bgCol;

        return FoldoutToggle(rect, evt, mouseOver, display, 0);
    }
    //End Foldout

    //Medium Foldout
    public static bool MediumFoldout(string header, bool display, MaterialEditor me, Color color){
        
        GUIStyle formatting = new GUIStyle("ShurikenModuleTitle");
        float lw = EditorGUIUtility.labelWidth;
        formatting.contentOffset = new Vector2(20f, -3f);
        formatting.fixedHeight = 22f;
        formatting.fixedWidth = GetInspectorWidth()+4f;
        formatting.font = new GUIStyle(EditorStyles.boldLabel).font;
        formatting.fontSize = 11;

        Rect rect = GUILayoutUtility.GetRect(0f, 20f, formatting);
        rect.x -= 4f;
        rect.width = lw;

        Event evt = Event.current;
        Color bgCol = GUI.backgroundColor;
        bool mouseOver = rect.Contains(evt.mousePosition);
        GUI.backgroundColor = color;

        if (evt.type == EventType.MouseDown && mouseOver){
            foldoutClicked = true;
            evt.Use();
        }
            
        else if (evt.type == EventType.Repaint && foldoutClicked && mouseOver){
            GUI.backgroundColor = Color.gray;
            me.Repaint();
        }

        GUI.Box(rect, header, formatting);
        GUI.backgroundColor = bgCol;
        
        return FoldoutToggle(rect, evt, mouseOver, display, 1);
    }
    //End Medium Foldout

    //Start Toggle Group
    public static void ToggleGroup(bool isToggled){
        EditorGUI.BeginDisabledGroup(isToggled);
    }
    public static void ToggleGroupEnd(){
        EditorGUI.EndDisabledGroup();
    }
    //End Toggle Group

    //parting lines
    static public void PartingLine()
    {
        GUILayout.Space(5);
        GUILine(new Color(1f, 1f, 1f), 1.5f);
        GUILayout.Space(5);
    }

    static public void GUILine(float height = 0f)
    {
        GUILine(Color.black, height);
    }

    static public void GUILine(Color color, float height = 0f)
    {
        Rect position = GUILayoutUtility.GetRect(0f, float.MaxValue, height, height, LineStyle);

        if (Event.current.type == EventType.Repaint)
        {
            Color orgColor = GUI.color;
            GUI.color = orgColor * color;
            LineStyle.Draw(position, false, false, false, false);
            GUI.color = orgColor;
        }
    }

    static public GUIStyle _LineStyle;
    static public GUIStyle LineStyle
    {
        get
        {
            if (_LineStyle == null)
            {
                _LineStyle = new GUIStyle();
                _LineStyle.normal.background = EditorGUIUtility.whiteTexture;
                _LineStyle.stretchWidth = true;
            }

            return _LineStyle;
        }
    }
    // end of parting line

    //exrta buttons
    public static void checkVersionButton(int Width, int Height)
    {
        if (GUILayout.Button("Check Version", GUILayout.Width(Width), GUILayout.Height(Height)))
        {
            Application.OpenURL("https://github.com/Aerthas/Aerthas-Unity-Shaders/releases/");
        }
    }

    public static void discordButton(int Width, int Height)
    {
        if (GUILayout.Button("Discord", GUILayout.Width(Width), GUILayout.Height(Height)))
        {
            Application.OpenURL("https://discord.gg/EkCSZg8");
            Debug.Log("Opened external url: https://discord.gg/EkCSZg8");
        }
    }

    public static void paypalButton(int Width, int Height)
    {
        if (GUILayout.Button( (Texture2D)Resources.Load("Paypal_Icon", typeof(Texture2D)), GUILayout.Width(Width), GUILayout.Height(Height)))
        {
            Application.OpenURL("https://www.paypal.me/thisismypaypal");
            Debug.Log("Opened external url: https://www.paypal.me/thisismypaypal");
        }
    }

    

    public static void DrawButtons()
    {
        ASWStyles.PartingLine();
        EditorGUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        ASWStyles.checkVersionButton(100,30);
        ASWStyles.discordButton(70,30);
        ASWStyles.paypalButton(30, 30);
        GUILayout.FlexibleSpace();
        EditorGUILayout.EndHorizontal();
    }
}