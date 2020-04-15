using System.Collections.Generic;
using UnityEditor;
using UnityEngine;
using System.IO;

// help link https://docs.unity3d.com/ScriptReference/EditorStyles.html
[InitializeOnLoad]
public class ASWstyles : MonoBehaviour
{
    private static Rect DrawShuriken(string title, Vector2 contentOffset, int HeaderHeight)
    {
        var style = new GUIStyle("ShurikenModuleTitle");
        style.font = new GUIStyle(EditorStyles.boldLabel).font;
        style.border = new RectOffset(15, 7, 4, 4);
        style.fixedHeight = HeaderHeight;
        style.contentOffset = contentOffset;
        var rect = GUILayoutUtility.GetRect(16f, HeaderHeight, style);

        GUI.Box(rect, title, style);
        return rect;
    }

    private static Rect DrawShurikenCenteredTitle(string title, Vector2 contentOffset, int HeaderHeight)
    {
        var style = new GUIStyle("ShurikenModuleTitle");
        style.font = new GUIStyle(EditorStyles.boldLabel).font;
        style.border = new RectOffset(15, 7, 4, 4);
        style.fixedHeight = HeaderHeight;
        style.contentOffset = contentOffset;
        style.alignment = TextAnchor.MiddleCenter;
        var rect = GUILayoutUtility.GetRect(16f, HeaderHeight, style);

        GUI.Box(rect, title, style);
        return rect;
    }

    public static bool ShurikenFoldout(string title, bool display)
    {
        var rect = DrawShuriken(title, new Vector2(20f, -2f), 22);
        var e = Event.current;
        var toggleRect = new Rect(rect.x + 4f, rect.y + 2f, 13f, 13f);
        if (e.type == EventType.Repaint)
        {
            EditorStyles.foldout.Draw(toggleRect, false, false, display, false);
        }
        if (e.type == EventType.MouseDown && rect.Contains(e.mousePosition))
        {
            display = !display;
            e.Use();
        }
        return display;
    }

    //parting line text
    private static Rect DrawShurikenPartingLineText(string title, Vector2 contentOffset, int HeaderHeight)
    {
        var style = new GUIStyle("ShurikenModuleTitle");
        style.font = new GUIStyle(EditorStyles.boldLabel).font;
        style.border = new RectOffset(15, 7, 4, 4);
        style.fixedHeight = HeaderHeight;
        style.contentOffset = contentOffset;
        style.alignment = TextAnchor.MiddleCenter;
        var rect = GUILayoutUtility.GetRect(16f, HeaderHeight, style);

        GUI.Box(rect, title, style);
        return rect;
    }
    //end of parting line text

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

    public static void ShurikenHeader(string title)
    {
        DrawShuriken(title, new Vector2(6f, -2f), 22);
    }

    public static void ShurikenHeaderCentered(string title)
    {
        DrawShurikenCenteredTitle(title, new Vector2(0f, -2f), 22);
    }

    public static void DrawShurikenPartingLineText(string title)
    {
        DrawShurikenPartingLineText(title, new Vector2(6f, -2f), 22);
    }

    public static void DrawButtons()
    {
        ASWstyles.PartingLine();
        EditorGUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        ASWstyles.checkVersionButton(100,30);
        ASWstyles.discordButton(70,30);
        GUILayout.FlexibleSpace();
        EditorGUILayout.EndHorizontal();
    }
}