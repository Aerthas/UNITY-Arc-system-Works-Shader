using UnityEditor;
using UnityEngine;
using System.Collections.Generic;
using System.IO;
using System.Reflection;

public class ASWGuiltyGearStriveGUI : ShaderGUI
{
  BindingFlags bindingFlags = BindingFlags.Public |
                              BindingFlags.NonPublic |
                              BindingFlags.Instance |
                              BindingFlags.Static;


  private static class Styles
  {
      public static GUIContent baseText = new GUIContent("Base Texture", "[Character Indentifier]_Base");
      public static GUIContent sssText = new GUIContent("SSS Texture", "[Character Indentifier]_SSS");
      public static GUIContent olmText = new GUIContent("OLM Texture", "[Character Indentifier]_OLM");
      public static GUIContent ilmText = new GUIContent("ILM Texture", "[Character Indentifier]_ILM");
      public static GUIContent detailText = new GUIContent("Detail Texture", "[Character Indentifier]_Detail");
      public static GUIContent glowMaskText = new GUIContent("Glow Mask", "[Character Indentifier]_GlowMask. Used by few characters.");
  }

  static string game = "GGStrive_Logo";

  MaterialProperty _EditorVersion = null;
  MaterialProperty _LightDirectionSetting = null;
  MaterialProperty _FallbackLightDirection = null;
  MaterialProperty _FakeLightDirX = null;
  MaterialProperty _FakeLightDirY = null;
  MaterialProperty _ViewDirOffsetPitch = null;
  MaterialProperty _ViewDirOffsetYaw = null;
  MaterialProperty _Opacity = null;

  MaterialProperty _LightColorSetting = null;
  MaterialProperty _MinimumGlobalLightIntensity = null;
  MaterialProperty _FakeGlobalLightColor = null;
  MaterialProperty _FakeGlobalLightIntensity = null;
  MaterialProperty _LightColor = null;
  MaterialProperty _AmbientColor = null;

  MaterialProperty _Base = null;
  MaterialProperty _SSS = null;
  MaterialProperty _OLM = null;
  MaterialProperty _ILM = null;
  MaterialProperty _ILMColorSetting = null;
  MaterialProperty _ILMAlphaColor = null;
  MaterialProperty _ILMAlphaEmissionIntensity = null;
  MaterialProperty _ILMAlphaLinesEmissionToggle = null;
  MaterialProperty _Detail = null;
  MaterialProperty _DetailColorSetting = null;
  MaterialProperty _BodyLinesColor = null;
  //MaterialProperty _BodyLinesEmissionToggle = null;
  //MaterialProperty _BodyLinesEmissionIntensity = null;

  MaterialProperty _EnableColorReplacer = null;
  MaterialProperty _TotalReplacements = null;

  MaterialProperty _Source1Color = null;
  MaterialProperty _Source1Fuzziness = null;
  MaterialProperty _Target1Color = null;
  MaterialProperty _SSSHueShift1 = null;

  MaterialProperty _Source2Color = null;
  MaterialProperty _Source2Fuzziness = null;
  MaterialProperty _Target2Color = null;
  MaterialProperty _SSSHueShift2 = null;

  MaterialProperty _Source3Color = null;
  MaterialProperty _Source3Fuzziness = null;
  MaterialProperty _Target3Color = null;
  MaterialProperty _SSSHueShift3 = null;

  MaterialProperty _Source4Color = null;
  MaterialProperty _Source4Fuzziness = null;
  MaterialProperty _Target4Color = null;
  MaterialProperty _SSSHueShift4 = null;

  MaterialProperty _Source5Color = null;
  MaterialProperty _Source5Fuzziness = null;
  MaterialProperty _Target5Color = null;
  MaterialProperty _SSSHueShift5 = null;

  MaterialProperty _RimlightIntensity = null;
  MaterialProperty _RimlightTint = null;
  MaterialProperty _RimlightSaturation = null;
  MaterialProperty _RimlightEmissiveToggle = null;
  MaterialProperty _RimlightEmissionIntensity = null;
  MaterialProperty _SpecularIntensity = null;
  MaterialProperty _SpecularTint = null;
  MaterialProperty _SpecularSaturation = null;
  MaterialProperty _SpecularEmissiveToggle = null;
  MaterialProperty _SpecularEmissionIntensity = null;
  MaterialProperty _BaseIntensity = null;
  MaterialProperty _BaseTint = null;
  MaterialProperty _BaseSaturation = null;
  MaterialProperty _BaseEmissiveToggle = null;
  MaterialProperty _BaseEmissionIntensity = null;
  MaterialProperty _SSSAlphaEmissiveToggle = null;
  MaterialProperty _SSSAlphaEmissiveIntensity = null;
  MaterialProperty _Shadow1Intensity = null;
  MaterialProperty _Shadow1Tint = null;
  MaterialProperty _Shadow1Saturation = null;
  MaterialProperty _Shadow1EmissiveToggle = null;
  MaterialProperty _Shadow1EmissionIntensity = null;
  MaterialProperty _Shadow2Intensity = null;
  MaterialProperty _Shadow2Tint = null;
  MaterialProperty _Shadow2Saturation = null;
  MaterialProperty _Shadow2EmissiveToggle = null;
  MaterialProperty _Shadow2EmissionIntensity = null;

  MaterialProperty _GlobalLightPush = null;
  MaterialProperty _EnableRimlight = null;
  MaterialProperty _RimlightSize = null;
  MaterialProperty _SpecularSize = null;
  MaterialProperty _Shadow1Push = null;
  MaterialProperty _Shadow1VertexRThreshold = null;
  MaterialProperty _Shadow2Push = null;
  MaterialProperty _Shadow2VertexRThreshold = null;
  MaterialProperty _PermanentShadowThreshold = null;

  MaterialProperty _EnableOutline = null;
  MaterialProperty _OutlineThickness = null;
  MaterialProperty _EnableCameraDistanceMult = null;
  MaterialProperty _DepthOffset = null;
  MaterialProperty _OutlineEnableBaseColorMult = null;
  MaterialProperty _OutlineColor = null;
  MaterialProperty _OutlineColorIntensity = null;

  MaterialProperty _Reference = null;
  MaterialProperty _ReadMask = null;
  MaterialProperty _WriteMask = null;
  MaterialProperty _Comparison = null;
  MaterialProperty _PassFront = null;
  MaterialProperty _FailFront = null;
  MaterialProperty _ZFailFront = null;

  MaterialProperty _ZWriteMode = null;
  MaterialProperty _ZTestMode = null;
  MaterialProperty _Factor = null;
  MaterialProperty _Units = null;

  MaterialProperty _EnableDebug = null;
  MaterialProperty _DebugColor = null;
  MaterialProperty _DebugGroup = null;
  MaterialProperty _VertexChannel = null;
  MaterialProperty _ILMChannel = null;
  MaterialProperty _BaseSSSAlphaSwap = null;

  Texture2D gameTex = (Texture2D)Resources.Load(game, typeof(Texture2D));

  public static Dictionary<Material, ASWToggles > foldouts = new Dictionary<Material, ASWToggles>();
  ASWToggles toggles = new ASWToggles(
    new bool[] {
      false, // Presets
      true, // Editor Version
      true, // Texture Settings
        false, // ILM Body Lines
        false, // Detail Body Lines
        false, // Color Replacer
          true, // Color 1
          true, // Color 2
          true, // Color 3
          true, // Color 4
          true, // Color 5
      true, // Light Settings
        false, // Light Direction Settings
        false, // Light Color Settings
          false, // Game Style Light Tinting
      true, // Ramp Settings
        false, // Rimlight
        false, // Specular
        false, // Base
        false, // Shadow 1
        false, // Shadow 2
      false, // Outline
        false, // Outline Thickness Settings
        false, // Outline Color Settings
      false, // Rendering Options
        false, // Stencil Buffer
        false, // Depth
      false, // Debug
      false // Credits
    },
    new string[] {
      "PRESETS",
      "Editor Version",
      "Texture Settings",
        "ILM Alpha Body Lines",
        "Detail Body Lines",
        "Color Replacer",
          "Color 1",
          "Color 2",
          "Color 3",
          "Color 4",
          "Color 5",
      "Light Settings",
        "Light Direction Settings",
        "Light Color Settings",
          "Game Style Light Tinting",
      "Ramp Settings",
        "Rimlight",
        "Specular",
        "Base",
        "Shadow 1",
        "Shadow 2",
      "Outline",
        "Outline Thickness Settings",
        "Outline Color Settings",
      "Rendering Options",
        "Stencil Buffer",
        "Depth",
      "Debug",
      "Credits"
    }
  );

  public static List<string> presetsList = new List<string>();
  public static string[] presets;
  string explain = null;
  static bool isTransparent = false;

  int popupIndex = 0;
  string presetText = "";
  string dirPath = "Assets/Aerthas-Unity-Shaders/Arc System Works Shader/Presets/";

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

    DirectoryInfo dir = new DirectoryInfo(dirPath);
    FileInfo[] info = dir.GetFiles();
    foreach (FileInfo f in info){
      if (!f.Name.Contains(".meta") && f.Name.Contains(".mat")){
        Material candidate = (Material)AssetDatabase.LoadAssetAtPath(dirPath + f.Name, typeof(Material));
        if (candidate.shader.name == mat.shader.name){
          int indOf = f.Name.IndexOf(".");
          presetsList.Add(f.Name.Substring(0, indOf));
        }
      }
    }
    presets = presetsList.ToArray();

    //Findprops(props);              // Find props
    EditorGUIUtility.labelWidth = 300f;   // Use default labelWidth
    EditorGUIUtility.fieldWidth = 50f;   // Use default labelWidth

    string[] shaderVersion = mat.shader.name.Split('/');
    if(shaderVersion[4].Contains("Transparent")){
      isTransparent = true;
    }
    else{
      isTransparent = false;
    }


    if(_EditorVersion.floatValue == 1){
      ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Merged Light " + "<color=#aa0000ff> "+shaderVersion[4]+"</color>" + "<color=#ffffffff> - </color><color=#edba00ff> Advanced</color><color=#ffffffff>  }</color>");
    }
    else{
      ASWStyles.ShurikenHeaderCentered("{  Arc System Works - Merged Light " + "<color=#aa0000ff> "+shaderVersion[4]+"</color>" + "<color=#ffffffff> - </color><color=#00aaaaff> Basic</color><color=#ffffffff>  }</color>");
    }

    EditorGUI.BeginChangeCheck();
    {
      ASWStyles.PropertyGroup( () => {
        me.ShaderProperty(_EditorVersion, " ");
        GUILayout.Space(-16);
        if ( ASWStyles.DoSmallFoldout(foldouts, mat, me, "Editor Version") ){
          ASWStyles.PropertyGroup( () => {
            if(_EditorVersion.floatValue == 1){
              ASWStyles.CenteredText("WARNING!",10,0,-5);
              ASWStyles.CenteredText("Advanced settings can allow you to fine tune settings if a preset is not close enough.",10,0,-5);
              ASWStyles.CenteredText("It is VERY easy to \"break\" these settings and achieve an undesireable look.",10,0,-5);
              ASWStyles.CenteredText("Only use this if you KNOW what you are doing!",10,0,0);
            }
            else{
              ASWStyles.CenteredText("Recommend loading a Preset from below!",10,0,0);
            }
          });
        }
      });
      if(isTransparent){
        me.ShaderProperty(_Opacity, _Opacity.displayName);
      }
      if (ASWStyles.DoFoldout(foldouts, mat, me, "PRESETS")){
        GUILayout.Space(4);
        float buttonWidth = EditorGUIUtility.labelWidth-5.0f;
        if (ASWStyles.SimpleButton("Capture", buttonWidth, 0)){
          presetText = ASWStyles.ReplaceInvalidChars(presetText);
          string filePath = dirPath + presetText + ".mat";
          Material newMat = new Material(mat);
          AssetDatabase.CreateAsset(newMat, filePath);
          AssetDatabase.Refresh();
        }
        GUILayout.Space(-17);
        Rect r = EditorGUILayout.GetControlRect();
        r.x += EditorGUIUtility.labelWidth;
        r.width = ASWStyles.GetPropertyWidth();
        presetText = EditorGUI.TextArea(r, presetText);
        if (ASWStyles.SimpleButton("Apply", buttonWidth, 0)){
          string presetPath = dirPath + presets[popupIndex] + ".mat";
          Material selectedMat = (Material)AssetDatabase.LoadAssetAtPath(presetPath, typeof(Material));
          mat.CopyPropertiesFromMaterial(selectedMat);
        }
        GUILayout.Space(-17);
        r = EditorGUILayout.GetControlRect();
        r.x += EditorGUIUtility.labelWidth;
        r.width = ASWStyles.GetPropertyWidth();
        popupIndex = EditorGUI.Popup(r, popupIndex, presets);
        GUILayout.Label("Presets are stored in:\n\""+dirPath+"\"",EditorStyles.textArea);
      }

      if (ASWStyles.DoFoldout(foldouts, mat, me, "Texture Settings")){
        ASWStyles.PropertyGroup( () => {
          me.TexturePropertySingleLine(Styles.baseText, _Base);
          if(_EditorVersion.floatValue == 1){
            GUILayout.Space(-18);
            me.ShaderProperty(_EnableColorReplacer,"                                         Enable Color Replacer");
          }
          me.TexturePropertySingleLine(Styles.sssText, _SSS);
          me.TexturePropertySingleLine(Styles.olmText, _OLM);
          me.TexturePropertySingleLine(Styles.ilmText, _ILM);
          if(_EditorVersion.floatValue == 1){
            GUILayout.Space(-18);
            me.ShaderProperty(_ILMColorSetting," ");
          }
          me.TexturePropertySingleLine(Styles.detailText, _Detail);
          if(_EditorVersion.floatValue == 1){
            GUILayout.Space(-18);
            me.ShaderProperty(_DetailColorSetting," ");
          }
        });

        if ( _EnableColorReplacer.floatValue == 1){
          if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Color Replacer", Color.cyan) ){
            me.ShaderProperty(_TotalReplacements, _TotalReplacements.displayName);
            for (int i = 1; i <= _TotalReplacements.floatValue; i++) {
              switch (i) {
                case 1:
                  ASWStyles.PropertyGroup( () => {
                    if (ASWStyles.DoSmallFoldout(foldouts, mat, me, "Color 1")){
                      ASWStyles.PropertyGroupLayer( () => {
                        me.ShaderProperty(_Source1Color, _Source1Color.displayName);
                        me.ShaderProperty(_Target1Color, _Target1Color.displayName);
                        me.ShaderProperty(_SSSHueShift1, _SSSHueShift1.displayName);
                        me.ShaderProperty(_Source1Fuzziness, _Source1Fuzziness.displayName);
                      });
                    }
                  });
                  break;
                case 2:
                  ASWStyles.PropertyGroup( () => {
                    if (ASWStyles.DoSmallFoldout(foldouts, mat, me, "Color 2")){
                      ASWStyles.PropertyGroupLayer( () => {
                        me.ShaderProperty(_Source2Color, _Source2Color.displayName);
                        me.ShaderProperty(_Target2Color, _Target2Color.displayName);
                        me.ShaderProperty(_SSSHueShift2, _SSSHueShift2.displayName);
                        me.ShaderProperty(_Source2Fuzziness, _Source2Fuzziness.displayName);
                      });
                    }
                  });
                  break;
                case 3:
                  ASWStyles.PropertyGroup( () => {
                    if (ASWStyles.DoSmallFoldout(foldouts, mat, me, "Color 3")){
                      ASWStyles.PropertyGroupLayer( () => {
                        me.ShaderProperty(_Source3Color, _Source3Color.displayName);
                        me.ShaderProperty(_Target3Color, _Target3Color.displayName);
                        me.ShaderProperty(_SSSHueShift3, _SSSHueShift3.displayName);
                        me.ShaderProperty(_Source3Fuzziness, _Source3Fuzziness.displayName);
                      });
                    }
                  });
                  break;
                case 4:
                  ASWStyles.PropertyGroup( () => {
                    if (ASWStyles.DoSmallFoldout(foldouts, mat, me, "Color 4")){
                      ASWStyles.PropertyGroupLayer( () => {
                        me.ShaderProperty(_Source4Color, _Source4Color.displayName);
                        me.ShaderProperty(_Target4Color, _Target4Color.displayName);
                        me.ShaderProperty(_SSSHueShift4, _SSSHueShift4.displayName);
                        me.ShaderProperty(_Source4Fuzziness, _Source4Fuzziness.displayName);
                      });
                    }
                  });
                  break;
                case 5:
                  ASWStyles.PropertyGroup( () => {
                    if (ASWStyles.DoSmallFoldout(foldouts, mat, me, "Color 5")){
                      ASWStyles.PropertyGroupLayer( () => {
                        me.ShaderProperty(_Source5Color, _Source5Color.displayName);
                        me.ShaderProperty(_Target5Color, _Target5Color.displayName);
                        me.ShaderProperty(_SSSHueShift5, _SSSHueShift5.displayName);
                        me.ShaderProperty(_Source5Fuzziness, _Source5Fuzziness.displayName);
                      });
                    }
                  });
                  break;
              }
            }
          }
        }
        if(_ILMColorSetting.floatValue > 0){
          if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "ILM Alpha Body Lines", Color.cyan) ){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_ILMAlphaColor, _ILMAlphaColor.displayName);
              me.ShaderProperty(_ILMAlphaLinesEmissionToggle, _ILMAlphaLinesEmissionToggle.displayName);
              if(_ILMAlphaLinesEmissionToggle.floatValue == 1){
                me.ShaderProperty(_ILMAlphaEmissionIntensity, _ILMAlphaEmissionIntensity.displayName);
              }
            });
          }
        }
      }
      if(_DetailColorSetting.floatValue > 0){
        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Detail Body Lines", Color.cyan) ){
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_BodyLinesColor, _BodyLinesColor.displayName);
            //me.ShaderProperty(_BodyLinesEmissionToggle, _BodyLinesEmissionToggle.displayName);
            //if(_BodyLinesEmissionToggle.floatValue == 1){
            //  me.ShaderProperty(_BodyLinesEmissionIntensity, _BodyLinesEmissionIntensity.displayName);
            //}
          });
        }
      }

      if ( ASWStyles.DoFoldout(foldouts, mat, me, "Light Settings") ){
        //GUILayout.Space(-16);
        //me.ShaderProperty(_LightDirectionSetting," ");
        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, _LightDirectionSetting, "Light Direction Settings", Color.yellow) ){
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_FallbackLightDirection, _FallbackLightDirection.displayName);
            ASWStyles.PropertyGroupLayer( () => {
              if(_FallbackLightDirection.floatValue == 0){
                me.ShaderProperty(_FakeLightDirX, _FakeLightDirX.displayName);
                me.ShaderProperty(_FakeLightDirY, _FakeLightDirY.displayName);
              }
              else{
                me.ShaderProperty(_ViewDirOffsetPitch, _ViewDirOffsetPitch.displayName);
                me.ShaderProperty(_ViewDirOffsetYaw, _ViewDirOffsetYaw.displayName);
              }
            });
          });
        }
        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me,_LightColorSetting, "Light Color Settings", Color.yellow) ){
            if(_EditorVersion.floatValue == 1){
              ASWStyles.PropertyGroup( () => {
                me.ShaderProperty(_MinimumGlobalLightIntensity, _MinimumGlobalLightIntensity.displayName);
              });
            }
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_FakeGlobalLightColor, _FakeGlobalLightColor.displayName);
              me.ShaderProperty(_FakeGlobalLightIntensity, _FakeGlobalLightIntensity.displayName);
            });
            if(_EditorVersion.floatValue == 1){
              ASWStyles.PropertyGroup( () => {
                if(ASWStyles.DoSmallFoldout(foldouts, mat, me, "Game Style Light Tinting")){
                  ASWStyles.PropertyGroupLayer( () => {
                    me.ShaderProperty(_LightColor, _LightColor.displayName);
                    me.ShaderProperty(_AmbientColor, _AmbientColor.displayName);
                  });
                }
              });
            }
        }
      }

      if ( ASWStyles.DoFoldout(foldouts, mat, me, "Ramp Settings") ){
        ASWStyles.PropertyGroup( () => {
          me.ShaderProperty(_GlobalLightPush, _GlobalLightPush.displayName);
        });
        if (_EditorVersion.floatValue == 1){
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_PermanentShadowThreshold, _PermanentShadowThreshold.displayName);
          });
        }
        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Rimlight", Color.yellow) ){
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_EnableRimlight, _EnableRimlight.displayName);
            ASWStyles.ToggleGroup(_EnableRimlight.floatValue == 0);
            me.ShaderProperty(_RimlightSize, _RimlightSize.displayName);
          });
          if(_EditorVersion.floatValue == 1){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_RimlightIntensity, _RimlightIntensity.displayName);
              me.ShaderProperty(_RimlightTint, _RimlightTint.displayName);
              me.ShaderProperty(_RimlightSaturation, _RimlightSaturation.displayName);
              me.ShaderProperty(_RimlightEmissiveToggle, _RimlightEmissiveToggle.displayName);
              if(_RimlightEmissiveToggle.floatValue == 1){
                me.ShaderProperty(_RimlightEmissionIntensity, _RimlightEmissionIntensity.displayName);
              }
            });
          }
          ASWStyles.ToggleGroupEnd();
        }
        if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Specular", Color.yellow) ){
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_SpecularSize, _SpecularSize.displayName);
          });
          if(_EditorVersion.floatValue == 1){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_SpecularIntensity, _SpecularIntensity.displayName);
              me.ShaderProperty(_SpecularTint, _SpecularTint.displayName);
              me.ShaderProperty(_SpecularSaturation, _SpecularSaturation.displayName);
              me.ShaderProperty(_SpecularEmissiveToggle, _SpecularEmissiveToggle.displayName);
              if(_SpecularEmissiveToggle.floatValue == 1){
                me.ShaderProperty(_SpecularEmissionIntensity, _SpecularEmissionIntensity.displayName);
              }
            });
          }
        }
        if(_EditorVersion.floatValue == 1){
          if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Base", Color.yellow) ){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_BaseIntensity, _BaseIntensity.displayName);
              me.ShaderProperty(_BaseTint, _BaseTint.displayName);
              me.ShaderProperty(_BaseSaturation, _BaseSaturation.displayName);
              me.ShaderProperty(_BaseEmissiveToggle, _BaseEmissiveToggle.displayName);
              if(_BaseEmissiveToggle.floatValue == 1){
                me.ShaderProperty(_BaseEmissionIntensity, _BaseEmissionIntensity.displayName);
              }
            });
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_SSSAlphaEmissiveToggle, _SSSAlphaEmissiveToggle.displayName);
              if(_SSSAlphaEmissiveToggle.floatValue == 1){
                me.ShaderProperty(_SSSAlphaEmissiveIntensity, _SSSAlphaEmissiveIntensity.displayName);
              }
            });
          }
          if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Shadow 1", Color.yellow) ){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_Shadow1Push, _Shadow1Push.displayName);
              me.ShaderProperty(_Shadow1VertexRThreshold, _Shadow1VertexRThreshold.displayName);
            });
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_Shadow1Intensity, _Shadow1Intensity.displayName);
              me.ShaderProperty(_Shadow1Tint, _Shadow1Tint.displayName);
              me.ShaderProperty(_Shadow1Saturation, _Shadow1Saturation.displayName);
              me.ShaderProperty(_Shadow1EmissiveToggle, _Shadow1EmissiveToggle.displayName);
              if(_Shadow1EmissiveToggle.floatValue == 1){
                me.ShaderProperty(_Shadow1EmissionIntensity, _Shadow1EmissionIntensity.displayName);
              }
            });
          }
          if ( ASWStyles.DoMediumFoldout(foldouts, mat, me, "Shadow 2", Color.yellow) ){
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_Shadow2Push, _Shadow2Push.displayName);
              me.ShaderProperty(_Shadow2VertexRThreshold, _Shadow2VertexRThreshold.displayName);
            });
            ASWStyles.PropertyGroup( () => {
              me.ShaderProperty(_Shadow2Intensity, _Shadow2Intensity.displayName);
              me.ShaderProperty(_Shadow2Tint, _Shadow2Tint.displayName);
              me.ShaderProperty(_Shadow2Saturation, _Shadow2Saturation.displayName);
              me.ShaderProperty(_Shadow2EmissiveToggle, _Shadow2EmissiveToggle.displayName);
              if(_Shadow2EmissiveToggle.floatValue == 1){
                me.ShaderProperty(_Shadow2EmissionIntensity, _Shadow2EmissionIntensity.displayName);
              }
            });
          }
        }
      }

      if ( ASWStyles.DoFoldout(foldouts, mat, me, "Outline") ){
        if(isTransparent){
          EditorGUILayout.BeginHorizontal();
          GUILayout.FlexibleSpace();
          if (GUILayout.Button("Outlines are not supported here on Transparent versions\nof the shader. Click here to learn how to\nproperly set up your outlines.", GUILayout.Width(400), GUILayout.Height(50)) == true){
            Application.OpenURL("https://www.youtube.com/watch?v=SYS3XlRmDaA");
              Debug.Log("Opened external url: https://www.youtube.com/watch?v=SYS3XlRmDaA");
          }
          GUILayout.FlexibleSpace();
          EditorGUILayout.EndHorizontal();
        }
        else{
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
      if(_EditorVersion.floatValue == 1){
        if ( ASWStyles.DoFoldout(foldouts, mat, me, "Rendering Options") ){
          if (ASWStyles.DoMediumFoldout(foldouts, mat, me, "Stencil Buffer",Color.yellow)){
            ASWStyles.PropertyGroupLayer( () => {
              me.ShaderProperty(_Reference,_Reference.displayName);
              me.ShaderProperty(_ReadMask,_ReadMask.displayName);
              me.ShaderProperty(_WriteMask,_WriteMask.displayName);
              me.ShaderProperty(_Comparison,_Comparison.displayName);
              me.ShaderProperty(_PassFront,_PassFront.displayName);
              me.ShaderProperty(_FailFront,_FailFront.displayName);
              me.ShaderProperty(_ZFailFront,_ZFailFront.displayName);
            });
          }
          if (ASWStyles.DoMediumFoldout(foldouts, mat, me, "Depth",Color.yellow)){
            ASWStyles.PropertyGroupLayer( () => {
              me.ShaderProperty(_ZWriteMode,_ZWriteMode.displayName);
              me.ShaderProperty(_ZTestMode,_ZTestMode.displayName);
              me.ShaderProperty(_Factor,_Factor.displayName);
              me.ShaderProperty(_Units,_Units.displayName);
            });
          }
        }
        if ( ASWStyles.DoFoldout(foldouts, mat, me, "Debug") ){
          ASWStyles.PropertyGroup( () => {
            me.ShaderProperty(_EnableDebug, "Enable Debug");
            if(_EnableDebug.floatValue == 1){
              ASWStyles.PropertyGroupLayer( () => {
                me.ShaderProperty(_DebugColor,_DebugColor.displayName);
                me.ShaderProperty(_DebugGroup,_DebugGroup.displayName);
              });
              ASWStyles.PropertyGroupLayer( () => {
                switch(_DebugGroup.floatValue){
                  case 0 :
                    me.ShaderProperty(_VertexChannel,_VertexChannel.displayName);
                    switch(_VertexChannel.floatValue){
                      case 1 :
                        explain = "Ambient Occlusion/Tendency to be shaded. The darker this channel is, the more likely that area is to be shaded.";
                        break;
                      case 2 :
                        explain = "Scales the outline based on distance to camera. The darker the channel is, the less the camera distance affects the scale.";
                        break;
                      case 3 :
                        explain = "Shifts the outline in the camera Z depth. The darker the channel is, the more the outline is shifted away from the camera.";
                        break;
                      case 4 :
                        explain = "Base outline thickness. The brighter the channel is, the thicker the outline is before any other effects are applied.";
                        break;
                    }
                    break;
                  case 1 :
                    me.ShaderProperty(_ILMChannel,_ILMChannel.displayName);
                    switch(_ILMChannel.floatValue){
                      case 1 :
                        explain = "Specular intensity. The brighter the channel, the brighter the specular is.";
                        break;
                      case 2 :
                        explain = "Tendency to be shaded. The darker this channel is, the more likely that area is to be shaded.";
                        break;
                      case 3 :
                        explain = "Specular Ease. The brighter the channel, the more likely it is to get specular. Black has no specular.";
                        break;
                      case 4 :
                        explain = "Body lines. By default this is multiplied directly onto the base texture. ";
                        break;
                    }
                    break;
                  case 2 :
                    me.ShaderProperty(_BaseSSSAlphaSwap,_BaseSSSAlphaSwap.displayName);
                    switch(_BaseSSSAlphaSwap.floatValue){
                      case 0 :
                        explain = "Rimlight scale. The brighter the channel, the larger the rimlight.";
                        break;
                      case 1 :
                        explain = "Currently unknown exact use";
                        break;
                    }
                    break;
                }
                GUILayout.Label("Explaination of this channel:\n"+explain, EditorStyles.helpBox);
              });
            }
          });
        }
      }

      if ( ASWStyles.DoFoldout(foldouts, mat, me, "Credits") ){
        GUILayout.Label("»Thanks to Shamwow for the absolute first guide on the absolute first initial version of the shader.\n\n»Thanks to VCD/Velon for his constant riding of me to keep working on my shader\n\n»Thanks to Nars290 for his constant positivity and assistance with testing and debugging\n\n»Thanks to AreCreeps for information on how the FighterZ Rimlight system works.\n\n»Thanks to Syll for their knowledge on the outline generation.\n\n»Dulce Sueños for being a grammar nazi. \n\n»Thanks to Morioh for showing me how to use custom editor styles. Really helped make the shader UI look a lot better!\n\n»Thanks to Mochie for his foldouts, the toggles that power it, and the presets system. (Even if it is jank and hacked together, its still fantastic!)\n\n»Thanks to ScruffyRuffles for his absolutely HUGE brain and explaining how to solve point lights and light attenuation. No more solar flares near point lights!\n\n»Thanks to ACIIL for his help in understanding the Unity View Matrix to fix the View Direction Offset.\n\n»Big thanks to everyone in the VRC Shader Development Discord for answering general questions and tips on how things work.\n\n»Thanks to EdwardsVSGaming for taking a VERY old version of my shader, editing it a small ammount, claiming the entire thing as his own without credit to me, and using deceptive comparisons between that shader and mine forcing me to get off my lazy streak and actually work on my shader again. *clap* *clap* Good job.", EditorStyles.textArea);
      }
      ASWStyles.PartingLine();
      me.RenderQueueField();
      ASWStyles.DrawButtons();
      ASWStyles.CenteredTexture(gameTex, 0, 0);
    }
  }
}
