using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Reflection;

public class ASWUtilsOutlineGUI : ShaderGUI
{
  BindingFlags bindingFlags = BindingFlags.Public |
                                BindingFlags.NonPublic |
                                BindingFlags.Instance |
                                BindingFlags.Static;
  private static class Styles
    {
        public static GUIContent baseText = new GUIContent("Base Texture", "[Character Indentifier]_Base");
    }

  public static Dictionary<Material, ASWToggles > foldouts = new Dictionary<Material, ASWToggles>();
    ASWToggles toggles = new ASWToggles(
    new bool[] {
      true, // Thickness
      true,
    },
    new string[] {
      "Thickness Settings",
      "Color Settings"
    }
  );

    MaterialProperty _OutlineColor = null;
    MaterialProperty _OutlineThickness = null;
    MaterialProperty _DepthOffset = null;
    MaterialProperty _EnableBaseColorMult = null;
    MaterialProperty _EnableCameraDistanceMult = null;
    MaterialProperty _OutlineColorIntensity = null;
    MaterialProperty _Base = null;

    public override void OnGUI (MaterialEditor me, MaterialProperty[] props)
    {
      Material mat = (Material)me.target;

    if (!foldouts.ContainsKey(mat)){
      foldouts.Add(mat, toggles);
    }

    foreach (var property in GetType().GetFields(bindingFlags)){
        if (property.FieldType == typeof(MaterialProperty))
        {
            property.SetValue(this, FindProperty(property.Name, props));
        }
    }
    string[] shaderVersion = mat.shader.name.Split('v');
    ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Outline v" + "<color=#ff0000ff> "+shaderVersion[1]+"</color>" + "<color=#ffffffff>  }</color>");

    EditorGUI.BeginChangeCheck();
    {
      EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
      EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

      ASWStyles.PartingLine();
      if (GUILayout.Button("How to properly set up your outlines") == true){
        Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
          Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
      }
      ASWStyles.PartingLine();
      GUILayout.Space(4);

      if (ASWStyles.DoFoldout(foldouts, mat, me, "Thickness Settings")){
        ASWStyles.PropertyGroupLayer( () => {
          me.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
          me.ShaderProperty(_EnableCameraDistanceMult, _EnableCameraDistanceMult.displayName);
          me.ShaderProperty(_DepthOffset, _DepthOffset.displayName);
        });
      }
      if (ASWStyles.DoFoldout(foldouts, mat, me, "Color Settings")){
        ASWStyles.PropertyGroupLayer( () => {
          me.ShaderProperty(_EnableBaseColorMult, _EnableBaseColorMult.displayName);
          if(_EnableBaseColorMult.floatValue == 1){
            me.TexturePropertySingleLine(Styles.baseText, _Base);
          }
          else{
            me.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
            me.ShaderProperty(_OutlineColorIntensity, _OutlineColorIntensity.displayName);
          }
        });
      }
    }
  }
}
public class ASWUtilsDecalGUI : ShaderGUI
{
  BindingFlags bindingFlags = BindingFlags.Public |
                                BindingFlags.NonPublic |
                                BindingFlags.Instance |
                                BindingFlags.Static;
  private static class Styles
  {
      public static GUIContent mainTex = new GUIContent("Decal Texture", "[Character Indentifier]_Decal");
  }

  MaterialProperty _Enable = null;
  MaterialProperty _MainTex = null;
  MaterialProperty _DiscolorationModifier = null;

  public override void OnGUI (MaterialEditor me, MaterialProperty[] props)
  {
    Material mat = (Material)me.target;


    foreach (var property in GetType().GetFields(bindingFlags)){
        if (property.FieldType == typeof(MaterialProperty))
        {
            property.SetValue(this, FindProperty(property.Name, props));
        }
    }
    string[] shaderVersion = mat.shader.name.Split('v');
    ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Decal v" + "<color=#ff0000ff> "+shaderVersion[1]+"</color><color=#ffffffff>" + "  }</color>");
    EditorGUI.BeginChangeCheck();
    {
      me.ShaderProperty(_Enable, _Enable.displayName);
      me.TexturePropertySingleLine(Styles.mainTex, _MainTex);
      me.ShaderProperty(_DiscolorationModifier, _DiscolorationModifier.displayName);
    }
  }
}
public class ASWUtilsMatcapGUI : ShaderGUI
{
  BindingFlags bindingFlags = BindingFlags.Public |
                              BindingFlags.NonPublic |
                              BindingFlags.Instance |
                              BindingFlags.Static;


  private static class Styles
  {
      public static GUIContent baseText = new GUIContent("Base Texture", "[Character Indentifier]_Base");
      public static GUIContent metalText = new GUIContent("Metal Texture", "[Character Indentifier]_Metal");
  }

  MaterialProperty _LightColorSetting = null;
  MaterialProperty _MinimumGlobalLightIntensity = null;
  MaterialProperty _FakeGlobalLightColor = null;
  MaterialProperty _FakeGlobalLightIntensity = null;

  MaterialProperty _Base = null;
  MaterialProperty _Metal = null;

  MaterialProperty _EnableOutline = null;
  MaterialProperty _OutlineThickness = null;
  MaterialProperty _EnableCameraDistanceMult = null;
  MaterialProperty _DepthOffset = null;
  MaterialProperty _OutlineEnableBaseColorMult = null;
  MaterialProperty _OutlineColor = null;
  MaterialProperty _OutlineColorIntensity = null;

  public static Dictionary<Material, ASWToggles > foldouts = new Dictionary<Material, ASWToggles>();
  ASWToggles toggles = new ASWToggles(
    new bool[] {
      true, // Color Settings
      true, // Light Settings
        false, // Light Color Settings
      false, // Outline
        false, // Outline Thickness Settings
        false, // Outline Color Settings
    },
    new string[] {
      "Color Settings",
      "Light Settings",
        "Light Color Settings",
      "Outline",
        "Outline Thickness Settings",
        "Outline Color Settings",
      "Debug",
    }
  );

  public override void OnGUI(MaterialEditor me, MaterialProperty[] props)
  {
    Material mat = (Material)me.target;

    foreach (var property in GetType().GetFields(bindingFlags)){
        if (property.FieldType == typeof(MaterialProperty))
        {
            property.SetValue(this, FindProperty(property.Name, props));
        }
    }

    if (!foldouts.ContainsKey(mat))
    foldouts.Add(mat, toggles);

    //Findprops(props);              // Find props
    EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
    EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

    string[] shaderVersion = mat.shader.name.Split('v');

    ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Metal/Matcap v" + "<color=#aa0000ff> "+shaderVersion[1]+"</color>" + "<color=#ffffffff>  }</color>");

    EditorGUI.BeginChangeCheck();
    {
      if (ASWStyles.DoFoldout(foldouts, mat, me, "Color Settings")){
        ASWStyles.PropertyGroup( () => {
          me.TexturePropertySingleLine(Styles.baseText, _Base);
          me.TexturePropertySingleLine(Styles.metalText, _Metal);
        });
      }

      if ( ASWStyles.DoFoldout(foldouts, mat, me, "Light Settings") ){
        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me,_LightColorSetting, "Light Color Settings", Color.yellow) ){
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_MinimumGlobalLightIntensity, _MinimumGlobalLightIntensity.displayName);
          });
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_FakeGlobalLightColor, _FakeGlobalLightColor.displayName);
            me.ShaderProperty(_FakeGlobalLightIntensity, _FakeGlobalLightIntensity.displayName);
          });
        }
      }

      if ( ASWStyles.DoFoldout(foldouts, mat, me, "Outline") ){
        EditorGUILayout.BeginHorizontal();
        GUILayout.FlexibleSpace();
        if (GUILayout.Button("DO NOT USE THIS UNLESS YOU ARE SUPER LAZY\nCLICK THIS TO LEARN HOW TO\nPROPERLY SET UP YOUR OUTLINES", GUILayout.Width(400), GUILayout.Height(50)) == true){
          Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
            Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
        }
        GUILayout.FlexibleSpace();
        EditorGUILayout.EndHorizontal();
        ASWStyles.PropertyGroup( () => {
          me.ShaderProperty(_EnableOutline, _EnableOutline.displayName);
        });
        if(_EnableOutline.floatValue == 1){
          if (ASWStyles.DoMediumFoldout(foldouts, mat, me, "Outline Thickness Settings",Color.cyan)){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_OutlineThickness, _OutlineThickness.displayName);
              me.ShaderProperty(_EnableCameraDistanceMult, _EnableCameraDistanceMult.displayName);
              me.ShaderProperty(_DepthOffset, _DepthOffset.displayName);
            });
          }
          if (ASWStyles.DoMediumFoldout(foldouts, mat, me, "Outline Color Settings",Color.cyan)){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_OutlineEnableBaseColorMult, _OutlineEnableBaseColorMult.displayName);
              if(_OutlineEnableBaseColorMult.floatValue == 0){
                ASWStyles.PropertyGroup( () => {
                  me.ShaderProperty(_OutlineColor, _OutlineColor.displayName);
                  me.ShaderProperty(_OutlineColorIntensity, _OutlineColorIntensity.displayName);
                });
              }
            });
          }
        }
      }
    }
  }
}
