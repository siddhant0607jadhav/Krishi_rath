import 'package:flutter/material.dart';

class LocalizationService extends ChangeNotifier {
  // Default to English
  Locale _locale = const Locale('en');

  Locale get locale => _locale;

  // All the translated text for the app
  final Map<String, Map<String, String>> _translations = {
    'en': {
      // Home Screen
      'welcome_title': 'Welcome, Raj Kumar',
      'home_active_plots': 'Active Plots',
      'home_crop_advisory': 'Crop Advisory',
      'home_pest_detection': 'Pest Detection',
      'home_market_prices': 'Market Insights',
      'home_community': 'Community',

      // Schemes Screen
      'schemes_title': 'Government Schemes',
      'schemes_subtitle': 'Access government benefits and subsidies for farmers',
      'schemes_pm_kisan_title': 'PM-KISAN',
      'schemes_pm_kisan_desc':
      '₹6000 per year income support for farmer families',
      'schemes_crop_insurance_title': 'Crop Insurance',
      'schemes_crop_insurance_desc':
      'Comprehensive risk coverage for crops against natural calamities',
      'schemes_status_active': 'Active',
      'schemes_status_open': 'Open',
      'schemes_amount_per_year': '₹6,000/year',
      'schemes_amount_upto': 'Up to ₹2 Lakh',
      'schemes_deadline': 'Deadline',
      'schemes_helpline': 'Helpline',

      // Updates Screen
      'updates_title': "Today's Updates",
      'updates_tab_all': 'All',
      'updates_tab_alerts': 'Alerts',
      'updates_tab_tasks': 'Tasks',
      'updates_tab_market': 'Market',
      'updates_tab_weather': 'Weather',
      'updates_pest_alert_title': 'Pest Alert: Aphids Detected',
      'updates_pest_alert_desc':
      'High aphid activity reported in your area. Check your crops and apply neem oil spray if affected.',
      'updates_task_fertilizer_title': "Today's Task: Apply Fertilizer",
      'updates_task_fertilizer_desc':
      "It's time to apply NPK fertilizer to your wheat crop. Weather conditions are ideal.",
      'updates_market_price_title': 'Market Price Update',
      'updates_market_price_desc':
      'Tomato prices have increased by 20% this week. Good time to sell your harvest.',
      'updates_load_more': 'Load More Updates',
      'priority_high': 'High',
      'priority_medium': 'Medium',
      'priority_low': 'Low',

      // Diary Screen
      'diary_title': 'Crop Diary',
      'diary_log_activity': "Log Today's Activity",
      'diary_voice_input': 'Voice Input',
      'diary_upcoming_tasks': 'Upcoming Tasks',
      'diary_recent_activities': 'Recent Activities',
      'diary_task_fertilizer': 'Apply fertilizer to wheat',
      'diary_task_pests': 'Check tomato plants for pests',
      'diary_task_harvest': 'Harvest ready cotton',
      'diary_activity_watered_title': 'Watered the wheat field',
      'diary_activity_watered_crop': 'Wheat',
      'diary_activity_watered_desc':
      'Applied water for 2 hours using drip irrigation.',
      'diary_activity_watered_weather': 'Sunny, 28°C',
      'diary_activity_applied_npk_title': 'Applied NPK fertilizer',
      'diary_activity_applied_npk_crop': 'Tomato',
      'diary_activity_applied_npk_desc':
      'Applied 50kg NPK (12:32:16) per acre as recommended.',
      'diary_activity_applied_npk_weather': 'Cloudy, 26°C',

      // Profile Screen
      'profile_title': 'Profile',
      'profile_farm_info': 'Farm Information',
      'profile_farm_size': 'Farm Size',
      'profile_experience': 'Experience',
      'profile_primary_language': 'Primary Language',
      'profile_member_since': 'Member Since',
      'profile_offline_capability': 'Offline Capability',
      'profile_offline_desc':
      'Your essential farm data is available offline. Last synced: 2 hours ago',
      'profile_offline_cta':
      'Weather data, crop info, and treatment guides available offline',
      'profile_settings': 'Settings',
      'profile_settings_desc': 'App preferences, notifications',
      'profile_offline_data': 'Offline Data',
      'profile_offline_data_desc': 'Download data for offline use',
      'profile_help_support': 'Help & Support',
      'profile_help_support_desc': 'Get help, contact support',
      'profile_contact_info': 'Contact Information',
      'profile_primary_contact': 'Primary contact number',
      'profile_emergency_contacts': 'Emergency Contacts',
      'profile_sign_out': 'Sign Out',

      // Crop Advisory Flow
      'crop_advisory_title': 'Crop Advisory',
      'crop_advisory_subtitle':
      'Select your crop to get personalized farming guidance',
      'crop_advisory_customize': 'Customize Crop',
      'crop_advisory_rice': 'Rice',
      'crop_advisory_wheat': 'Wheat',
      'crop_advisory_cotton': 'Cotton',
      'crop_advisory_maize': 'Maize',
      'crop_advisor_form_title': 'Crop Advisor',
      'crop_advisor_form_land_details': 'Land Details',
      'crop_advisor_form_land_area': 'Land Area (acres)',
      'crop_advisor_form_soil_type': 'Land Soil Type',
      'crop_advisor_form_irrigation_type': 'Irrigation Type',
      'crop_advisor_form_get_recommendation': 'Get Recommendation',
      'crop_advisor_form_get_plan': 'Get Plan',
      'personalized_plan_title': 'Your Personalized Plan',
      'personalized_plan_summary_title': 'Recommendation Summary',
      'personalized_plan_summary_desc':
      'Based on your input of Loamy Soil and Drip Irrigation, the recommended crop is Wheat.',
      'personalized_plan_step1_title': 'Step 1: Land Preparation',
      'personalized_plan_step2_title': 'Step 2: Sowing & Planting',
      'personalized_plan_step3_title': 'Step 3: Fertilization Schedule',
      'crop_advisor_form_hint_area': 'e.g., 5.0',
      'crop_advisor_form_hint_soil': 'e.g., Loamy, Sandy',
      'crop_advisor_form_hint_irrigation': 'Select an irrigation method',
      'irrigation_drip': 'Drip Irrigation',
      'irrigation_sprinkler': 'Sprinkler',
      'irrigation_canal': 'Canal',

      // Market Insights
      'market_prices_title': 'Market Insights',
      'market_prices_live': 'Live',
      'market_prices_per_quintal': 'per quintal',
      'market_prices_vs_yesterday': 'vs yesterday',

      // Community Forum
      'community_title': 'Community Forum',
      'community_share_experience': 'Share Your Experience',
      'community_share_experience_subtitle':
      'Record a 30-second voice message for the community',
      'community_record_button': 'Record 30s Question',
      'community_tag_crops': 'Crops',
      'community_tag_tips': 'Tips',
      'community_tag_govt': 'Govt. Schemes',
      'community_post_1_text':
      'My wheat crop is showing yellow leaves. What should I do?',
      'community_post_2_text':
      'I use neem oil mixed with soap water for pest control. Very effective and organic!',
      'community_post_3_text':
      'PM-KISAN installment received today. ₹2000 credited to account. Check your status!',

      // Pest Detection
      'pest_detection_title': 'Pest Detection',
      'pest_detection_subtitle':
      'Scan your plants to identify diseases and get treatment advice',
      'pest_detection_viewfinder_title': 'Camera Viewfinder',
      'pest_detection_viewfinder_subtitle':
      'Point camera at affected plant area',
      'pest_detection_instructions_title': 'How to scan effectively:',
      'pest_detection_instruction_1':
      'Hold phone steady and close to the plant',
      'pest_detection_instruction_2': 'Ensure good lighting conditions',
      'pest_detection_instruction_3':
      'Focus on the affected area (leaves, stems, fruits)',
      'pest_detection_instruction_4':
      'Keep background simple and uncluttered',
      'pest_detection_capture_button': 'Capture Photo',
      'pest_detection_upload_button': 'Upload Image',

      // New translations for crop advisory
      'validation_land_area_required': 'Please enter land area',
      'validation_land_area_number': 'Please enter a valid number',
      'validation_land_area_positive': 'Land area must be greater than 0',
      'validation_soil_type_required': 'Please enter soil type',
      'validation_soil_type_valid': 'Please enter a valid soil type',
      'validation_irrigation_required': 'Please select an irrigation method',
      'recommendation_success': 'Recommendation generated successfully!',
      'reset_form_tooltip': 'Reset Form',
      'reset_form_button': 'Reset Form',
      'not_selected': 'Not selected',
      'acres_unit': 'acres',
      'form_summary': 'Form Summary:',
      'Step': 'Step',

      // Crop recommendation texts
      'recommendation_based_on': 'Based on your input of',
      'recommendation_land_area': 'acres with',
      'recommendation_soil': 'soil and',
      'recommendation_irrigation': 'irrigation, the recommended crop is',
      'recommendation_crop_loamy': 'Wheat',
      'recommendation_crop_sandy': 'Groundnut',
      'recommendation_crop_clay': 'Rice',
      'recommendation_crop_default': 'Maize',

      // Plan step tasks
      'plan_task_plow': 'Plow the field 2-3 times to get a fine tilth.',
      'plan_task_manure': 'Apply 10-15 tons of farmyard manure per acre.',
      'plan_task_seeds': 'Use certified seeds for best results.',
      'plan_task_spacing': 'Maintain a row-to-row spacing of 30 cm.',
      'plan_task_npk1': 'Apply first dose of NPK fertilizer after 25 days.',
      'plan_task_npk2': 'Second dose should be applied at the flowering stage.',
    },
    'hi': {
      // Home Screen
      'welcome_title': 'स्वागत है, राज कुमार',
      'home_active_plots': 'सक्रिय प्लॉट',
      'home_crop_advisory': 'फसल सलाहकार',
      'home_pest_detection': 'कीट पहचान',
      'home_market_prices': 'बाजार अंतर्दृष्टि',
      'home_community': 'समुदाय',

      // Schemes Screen
      'schemes_title': 'सरकारी योजनाएं',
      'schemes_subtitle': 'किसानों के लिए सरकारी लाभ और सब्सिडी प्राप्त करें',
      'schemes_pm_kisan_title': 'पीएम-किसान',
      'schemes_pm_kisan_desc': 'किसान परिवारों के लिए ₹6000 प्रति वर्ष आय सहायता',
      'schemes_crop_insurance_title': 'फसल बीमा',
      'schemes_crop_insurance_desc':
      'प्राकृतिक आपदाओं के खिलाफ फसलों के लिए व्यापक जोखिम कवरेज',
      'schemes_status_active': 'सक्रिय',
      'schemes_status_open': 'खुला',
      'schemes_amount_per_year': '₹6,000/वर्ष',
      'schemes_amount_upto': '₹2 लाख तक',
      'schemes_deadline': 'अंतिम तिथि',
      'schemes_helpline': 'हेल्पलाइन',

      // Updates Screen
      'updates_title': 'आज की जानकारी',
      'updates_tab_all': 'सभी',
      'updates_tab_alerts': 'चेतावनी',
      'updates_tab_tasks': 'कार्य',
      'updates_tab_market': 'बाजार',
      'updates_tab_weather': 'मौसम',
      'updates_pest_alert_title': 'कीट चेतावनी: माहू का पता चला',
      'updates_pest_alert_desc':
      'आपके क्षेत्र में माहू की उच्च गतिविधि की सूचना मिली है। अपनी फसलों की जांच करें और प्रभावित होने पर नीम के तेल का छिड़काव करें।',
      'updates_task_fertilizer_title': 'आज का कार्य: उर्वरक डालना',
      'updates_task_fertilizer_desc':
      'गेहूं की फसल में एनपीके उर्वरक डालने का समय है। मौसम की स्थिति आदर्श है।',
      'updates_market_price_title': 'बाजार मूल्य अद्यतन',
      'updates_market_price_desc':
      'इस सप्ताह टमाटर की कीमतों में 20% की वृद्धि हुई है। अपनी फसल बेचने का यह अच्छा समय है।',
      'updates_load_more': 'और अपडेट लोड करें',
      'priority_high': 'उच्च',
      'priority_medium': 'मध्यम',
      'priority_low': 'कम',

      // Diary Screen
      'diary_title': 'फसल डायरी',
      'diary_log_activity': 'आज की गतिविधि लॉग करें',
      'diary_voice_input': 'आवाज इनपुट',
      'diary_upcoming_tasks': 'आगामी कार्य',
      'diary_recent_activities': 'हाल की गतिविधियाँ',
      'diary_task_fertilizer': 'गेहूं में उर्वरक डालें',
      'diary_task_pests': 'टमाटर के पौधों में कीटों की जांच करें',
      'diary_task_harvest': 'कपास की कटाई के लिए तैयार',
      'diary_activity_watered_title': 'गेहूं के खेत में पानी दिया',
      'diary_activity_watered_crop': 'गेहूं',
      'diary_activity_watered_desc':
      'ड्रिप सिंचाई का उपयोग करके 2 घंटे तक पानी दिया।',
      'diary_activity_watered_weather': 'धूप, 28°C',
      'diary_activity_applied_npk_title': 'एनपीके उर्वरक डाला',
      'diary_activity_applied_npk_crop': 'टमाटर',
      'diary_activity_applied_npk_desc':
      'सिफारिश के अनुसार प्रति एकड़ 50 किलो एनपीके (12:32:16) डाला।',
      'diary_activity_applied_npk_weather': 'बादल छाए रहेंगे, 26°C',

      // Profile Screen
      'profile_title': 'प्रोफ़ाइल',
      'profile_farm_info': 'खेत की जानकारी',
      'profile_farm_size': 'खेत का आकार',
      'profile_experience': 'अनुभव',
      'profile_primary_language': 'प्राथमिक भाषा',
      'profile_member_since': 'सदस्यता जबसे',
      'profile_offline_capability': 'ऑफ़लाइन क्षमता',
      'profile_offline_desc':
      'आपका आवश्यक कृषि डेटा ऑफ़लाइन उपलब्ध है। अंतिम सिंक: 2 घंटे पहले',
      'profile_offline_cta':
      'मौसम डेटा, फसल की जानकारी, और उपचार गाइड ऑफ़लाइन उपलब्ध हैं',
      'profile_settings': 'सेटिंग्स',
      'profile_settings_desc': 'ऐप प्राथमिकताएं, सूचनाएं',
      'profile_offline_data': 'ऑफ़लाइन डेटा',
      'profile_offline_data_desc': 'ऑफ़लाइन उपयोग के लिए डेटा डाउनलोड करें',
      'profile_help_support': 'सहायता और समर्थन',
      'profile_help_support_desc': 'सहायता प्राप्त करें, समर्थन से संपर्क करें',
      'profile_contact_info': 'संपर्क जानकारी',
      'profile_primary_contact': 'प्राथमिक संपर्क नंबर',
      'profile_emergency_contacts': 'आपातकालीन संपर्क',
      'profile_sign_out': 'साइन आउट',

      // Crop Advisory Flow
      'crop_advisory_title': 'फसल सलाहकार',
      'crop_advisory_subtitle':
      'व्यक्तिगत खेती मार्गदर्शन के लिए अपनी फसल चुनें',
      'crop_advisory_customize': 'फसल अनुकूलित करें',
      'crop_advisory_rice': 'चावल',
      'crop_advisory_wheat': 'गेहूं',
      'crop_advisory_cotton': 'कपास',
      'crop_advisory_maize': 'मक्का',
      'crop_advisor_form_title': 'फसल सलाहकार',
      'crop_advisor_form_land_details': 'भूमि का विवरण',
      'crop_advisor_form_land_area': 'भूमि क्षेत्र (एकड़)',
      'crop_advisor_form_soil_type': 'भूमि मिट्टी का प्रकार',
      'crop_advisor_form_irrigation_type': 'सिंचाई का प्रकार',
      'crop_advisor_form_get_recommendation': 'सिफारिश प्राप्त करें',
      'crop_advisor_form_get_plan': 'योजना प्राप्त करें',
      'personalized_plan_title': 'आपकी व्यक्तिगत योजना',
      'personalized_plan_summary_title': 'सिफारिश सारांश',
      'personalized_plan_summary_desc':
      'आपकी दोमट मिट्टी और ड्रिप सिंचाई के इनपुट के आधार पर, अनुशंसित फसल गेहूं है।',
      'personalized_plan_step1_title': 'चरण 1: भूमि की तैयारी',
      'personalized_plan_step2_title': 'चरण 2: बुवाई और रोपण',
      'personalized_plan_step3_title': 'चरण 3: उर्वरीकरण अनुसूची',
      'crop_advisor_form_hint_area': 'उदा., 5.0',
      'crop_advisor_form_hint_soil': 'उदा., दोमट, रेतीली',
      'crop_advisor_form_hint_irrigation': 'सिंचाई विधि चुनें',
      'irrigation_drip': 'ड्रिप सिंचाई',
      'irrigation_sprinkler': 'स्प्रिंकलर',
      'irrigation_canal': 'नहर',

      // Market Insights
      'market_prices_title': 'बाजार अंतर्दृष्टि',
      'market_prices_live': 'लाइव',
      'market_prices_per_quintal': 'प्रति क्विंटल',
      'market_prices_vs_yesterday': 'कल की तुलना में',

      // Community Forum
      'community_title': 'किसान समुदाय',
      'community_share_experience': 'अपना अनुभव साझा करें',
      'community_share_experience_subtitle':
      'समुदाय के लिए 30 सेकंड का ध्वनि संदेश रिकॉर्ड करें',
      'community_record_button': '30 सेकंड का सवाल रिकॉर्ड करें',
      'community_tag_crops': 'फसलें',
      'community_tag_tips': 'सुझाव',
      'community_tag_govt': 'सरकारी योजनाएं',
      'community_post_1_text':
      'मेरी गेहूं की फसल में पीली पत्तियां हो रही हैं। मुझे क्या करना चाहिए?',
      'community_post_2_text':
      'मैं कीट नियंत्रण के लिए नीम के तेल को साबुन के पानी में मिलाकर इस्तेमाल करता हूं। बहुत प्रभावी और जैविक!',
      'community_post_3_text':
      'पीएम-किसान की किस्त आज मिली। खाते में ₹2000 जमा हुए। अपनी स्थिति जांचें!',

      // Pest Detection
      'pest_detection_title': 'कीट पहचान',
      'pest_detection_subtitle':
      'रोगों की पहचान और उपचार सलाह के लिए अपने पौधों को स्कैन करें',
      'pest_detection_viewfinder_title': 'कैमरा व्यूफाइंडर',
      'pest_detection_viewfinder_subtitle':
      'प्रभावित पौधे के हिस्से पर कैमरा पॉइंट करें',
      'pest_detection_instructions_title': 'प्रभावी ढंग से स्कैन कैसे करें:',
      'pest_detection_instruction_1':
      'फोन को स्थिर रखें और पौधे के पास ले जाएं',
      'pest_detection_instruction_2': 'अच्छी रोशनी सुनिश्चित करें',
      'pest_detection_instruction_3':
      'प्रभावित क्षेत्र पर ध्यान दें (पत्तियां, तना, फल)',
      'pest_detection_instruction_4':
      'पृष्ठभूमि को सरल और अव्यवस्थित रखें',
      'pest_detection_capture_button': 'फोटो लें',
      'pest_detection_upload_button': 'छवि अपलोड करें',

      // New translations for crop advisory
      'validation_land_area_required': 'कृपया भूमि क्षेत्र दर्ज करें',
      'validation_land_area_number': 'कृपया एक वैध संख्या दर्ज करें',
      'validation_land_area_positive': 'भूमि क्षेत्र 0 से अधिक होना चाहिए',
      'validation_soil_type_required': 'कृपया मिट्टी का प्रकार दर्ज करें',
      'validation_soil_type_valid': 'कृपया एक वैध मिट्टी प्रकार दर्ज करें',
      'validation_irrigation_required': 'कृपया सिंचाई विधि चुनें',
      'recommendation_success': 'सिफारिश सफलतापूर्वक उत्पन्न हुई!',
      'reset_form_tooltip': 'फॉर्म रीसेट करें',
      'reset_form_button': 'फॉर्म रीसेट करें',
      'not_selected': 'चयनित नहीं',
      'acres_unit': 'एकड़',
      'form_summary': 'फॉर्म सारांश:',
      'Step': 'चरण',

      // Crop recommendation texts
      'recommendation_based_on': 'आपके इनपुट के आधार पर',
      'recommendation_land_area': 'एकड़ के साथ',
      'recommendation_soil': 'मिट्टी और',
      'recommendation_irrigation': 'सिंचाई, अनुशंसित फसल है',
      'recommendation_crop_loamy': 'गेहूं',
      'recommendation_crop_sandy': 'मूंगफली',
      'recommendation_crop_clay': 'चावल',
      'recommendation_crop_default': 'मक्का',

      // Plan step tasks
      'plan_task_plow': 'खेत की 2-3 बार जुताई करें ताकि मिट्टी भुरभुरी हो जाए।',
      'plan_task_manure': 'प्रति एकड़ 10-15 टन गोबर की खाद डालें।',
      'plan_task_seeds': 'सर्वोत्तम परिणामों के लिए प्रमाणित बीजों का उपयोग करें।',
      'plan_task_spacing': 'पंक्ति से पंक्ति की दूरी 30 सेमी बनाए रखें।',
      'plan_task_npk1': '25 दिनों के बाद एनपीके उर्वरक की पहली खुराक डालें।',
      'plan_task_npk2': 'दूसरी खुराक फूल आने की अवस्था में दी जानी चाहिए।',
    },
    'mr': {
      // Home Screen
      'welcome_title': 'स्वागत आहे, राज कुमार',
      'home_active_plots': 'सक्रिय भूखंड',
      'home_crop_advisory': 'पीक सल्ला',
      'home_pest_detection': 'कीड ओळख',
      'home_market_prices': 'बाजार अंतर्दृष्टी',
      'home_community': 'समुदाय',

      // Schemes Screen
      'schemes_title': 'सरकारी योजना',
      'schemes_subtitle': 'शेतकऱ्यांसाठी सरकारी लाभ आणि अनुदान मिळवा',
      'schemes_pm_kisan_title': 'पीएम-किसान',
      'schemes_pm_kisan_desc':
      'शेतकरी कुटुंबांसाठी प्रति वर्ष ₹6000 उत्पन्न समर्थन',
      'schemes_crop_insurance_title': 'पीक विमा',
      'schemes_crop_insurance_desc':
      'नैसर्गिक आपत्तींपासून पिकांसाठी व्यापक धोका कवच',
      'schemes_status_active': 'सक्रिय',
      'schemes_status_open': 'उघडा',
      'schemes_amount_per_year': '₹6,000/वर्ष',
      'schemes_amount_upto': '₹2 लाख पर्यंत',
      'schemes_deadline': 'अंतिम मुदत',
      'schemes_helpline': 'हेल्पलाइन',

      // Updates Screen
      'updates_title': 'आजची अद्यतने',
      'updates_tab_all': 'सर्व',
      'updates_tab_alerts': 'सूचना',
      'updates_tab_tasks': 'कामे',
      'updates_tab_market': 'बाजार',
      'updates_tab_weather': 'हवामान',
      'updates_pest_alert_title': 'कीड सूचना: मावा आढळला',
      'updates_pest_alert_desc':
      'तुमच्या परिसरात माव्याचा प्रादुर्भाव वाढला आहे. तुमच्या पिकांची तपासणी करा आणि गरज भासल्यास कडुलिंबाच्या तेलाची फवारणी करा.',
      'updates_task_fertilizer_title': 'आजचे काम: खत घालणे',
      'updates_task_fertilizer_desc':
      'तुमच्या गव्हाच्या पिकाला NPK खत देण्याची वेळ झाली आहे. हवामान अनुकूल आहे.',
      'updates_market_price_title': 'बाजार भाव अद्यतन',
      'updates_market_price_desc':
      'या आठवड्यात टोमॅटोच्या दरात २०% वाढ झाली आहे. तुमचे पीक विकण्याची ही चांगली वेळ आहे.',
      'updates_load_more': 'अधिक अद्यतने लोड करा',
      'priority_high': 'उच्च',
      'priority_medium': 'मध्यम',
      'priority_low': 'कमी',

      // Diary Screen
      'diary_title': 'पीक डायरी',
      'diary_log_activity': 'आजच्या कामाची नोंद करा',
      'diary_voice_input': 'व्हॉइस इनपुट',
      'diary_upcoming_tasks': 'आगामी कामे',
      'diary_recent_activities': 'अलीकडील कामे',
      'diary_task_fertilizer': 'गव्हाला खत द्या',
      'diary_task_pests': 'टोमॅटोच्या रोपांची कीड तपासा',
      'diary_task_harvest': 'कापूस काढणीसाठी तयार',
      'diary_activity_watered_title': 'गव्हाच्या शेताला पाणी दिले',
      'diary_activity_watered_crop': 'गहू',
      'diary_activity_watered_desc': 'ठिबक सिंचनाचा वापर करून २ तास पाणी दिले.',
      'diary_activity_watered_weather': 'निरभ्र, 28°C',
      'diary_activity_applied_npk_title': 'NPK खत दिले',
      'diary_activity_applied_npk_crop': 'टोमॅटो',
      'diary_activity_applied_npk_desc':
      'शिफारशीनुसार प्रति एकर 50 किलो एनपीके (12:32:16) दिले.',
      'diary_activity_applied_npk_weather': 'ढगाळ, 26°C',

      // Profile Screen
      'profile_title': 'प्रोफाइल',
      'profile_farm_info': 'शेतीची माहिती',
      'profile_farm_size': 'शेतीचा आकार',
      'profile_experience': 'अनुभव',
      'profile_primary_language': 'प्राथमिक भाषा',
      'profile_member_since': 'सदस्य झाल्यापासून',
      'profile_offline_capability': 'ऑफलाइन क्षमता',
      'profile_offline_desc':
      'तुमचा आवश्यक शेती डेटा ऑफलाइन उपलब्ध आहे. शेवटचे सिंक: 2 तासांपूर्वी',
      'profile_offline_cta':
      'हवामान डेटा, पीक माहिती, आणि उपचार मार्गदर्शक ऑफलाइन उपलब्ध आहेत',
      'profile_settings': 'सेटिंग्ज',
      'profile_settings_desc': 'अ‍ॅप प्राधान्ये, सूचना',
      'profile_offline_data': 'ऑफलाइन डेटा',
      'profile_offline_data_desc': 'ऑफलाइन वापरासाठी डेटा डाउनलोड करा',
      'profile_help_support': 'मदत आणि समर्थन',
      'profile_help_support_desc': 'मदत मिळवा, समर्थनाशी संपर्क साधा',
      'profile_contact_info': 'संपर्क माहिती',
      'profile_primary_contact': 'प्राथमिक संपर्क क्रमांक',
      'profile_emergency_contacts': 'आणीबाणी संपर्क',
      'profile_sign_out': 'साइन आउट',

      // Crop Advisory Flow
      'crop_advisory_title': 'पीक सल्ला',
      'crop_advisory_subtitle': 'वैयक्तिकृत शेती मार्गदर्शनासाठी आपले पीक निवडा',
      'crop_advisory_customize': 'पीक सानुकूलित करा',
      'crop_advisory_rice': 'भात',
      'crop_advisory_wheat': 'गहू',
      'crop_advisory_cotton': 'कापूस',
      'crop_advisory_maize': 'मका',
      'crop_advisor_form_title': 'पीक सल्लागार',
      'crop_advisor_form_land_details': 'जमिनीचा तपशील',
      'crop_advisor_form_land_area': 'जमीन क्षेत्र (एकर)',
      'crop_advisor_form_soil_type': 'जमिनीचा प्रकार',
      'crop_advisor_form_irrigation_type': 'सिंचनाचा प्रकार',
      'crop_advisor_form_get_recommendation': 'शिफारस मिळवा',
      'crop_advisor_form_get_plan': 'योजना मिळवा',
      'personalized_plan_title': 'तुमची वैयक्तिकृत योजना',
      'personalized_plan_summary_title': 'शिफारस सारांश',
      'personalized_plan_summary_desc':
      'तुमच्या चिकणमाती आणि ठिबक सिंचनाच्या माहितीनुसार, गहू हे शिफारस केलेले पीक आहे.',
      'personalized_plan_step1_title': 'पायरी 1: जमिनीची तयारी',
      'personalized_plan_step2_title': 'पायरी 2: पेरणी आणि लागवड',
      'personalized_plan_step3_title': 'पायरी 3: खत व्यवस्थापन',
      'crop_advisor_form_hint_area': 'उदा., 5.0',
      'crop_advisor_form_hint_soil': 'उदा., चिकणमाती, वालुकामय',
      'crop_advisor_form_hint_irrigation': 'सिंचन पद्धत निवडा',
      'irrigation_drip': 'ठिबक सिंचन',
      'irrigation_sprinkler': 'तुषार सिंचन',
      'irrigation_canal': 'कालवा',

      // Market Insights
      'market_prices_title': 'बाजार अंतर्दृष्टी',
      'market_prices_live': 'थेट',
      'market_prices_per_quintal': 'प्रति क्विंटल',
      'market_prices_vs_yesterday': 'कालच्या तुलनेत',

      // Community Forum
      'community_title': 'शेतकरी समुदाय',
      'community_share_experience': 'तुमचा अनुभव सांगा',
      'community_share_experience_subtitle':
      'समुदायासाठी 30-सेकंदांचा व्हॉइस संदेश रेकॉर्ड करा',
      'community_record_button': '30 सेकंदांचा प्रश्न रेकॉर्ड करा',
      'community_tag_crops': 'पिके',
      'community_tag_tips': 'टिपा',
      'community_tag_govt': 'सरकारी योजना',
      'community_post_1_text':
      'माझ्या गव्हाच्या पिकाला पिवळी पाने येत आहेत. मी काय करावे?',
      'community_post_2_text':
      'मी कीड नियंत्रणासाठी कडुलिंबाचे तेल साबणाच्या पाण्यात मिसळून वापरतो. खूप प्रभावी आणि सेंद्रिय!',
      'community_post_3_text':
      'पीएम-किसानचा हप्ता आज मिळाला. खात्यात ₹2000 जमा झाले. तुमची स्थिती तपासा!',

      // Pest Detection
      'pest_detection_title': 'कीड ओळख',
      'pest_detection_subtitle':
      'रोगांची ओळख आणि उपचार सल्ल्यासाठी तुमची रोपे स्कॅन करा',
      'pest_detection_viewfinder_title': 'कॅमेरा व्ह्यूफाइंडर',
      'pest_detection_viewfinder_subtitle':
      'प्रभावित वनस्पती क्षेत्रावर कॅमेरा निर्देशित करा',
      'pest_detection_instructions_title': 'प्रभावीपणे कसे स्कॅन करावे:',
      'pest_detection_instruction_1':
      'फोन स्थिर धरा आणि वनस्पतीच्या जवळ ठेवा',
      'pest_detection_instruction_2': 'चांगली प्रकाश व्यवस्था असल्याची खात्री करा',
      'pest_detection_instruction_3':
      'प्रभावित भागावर लक्ष केंद्रित करा (पाने, देठ, फळे)',
      'pest_detection_instruction_4':
      'पार्श्वभूमी साधी आणि गोंधळविरहित ठेवा',
      'pest_detection_capture_button': 'फोटो काढा',
      'pest_detection_upload_button': 'प्रतिमा अपलोड करा',

      // New translations for crop advisory
      'validation_land_area_required': 'कृपया जमीन क्षेत्र प्रविष्ट करा',
      'validation_land_area_number': 'कृपया एक वैध संख्या प्रविष्ट करा',
      'validation_land_area_positive': 'जमीन क्षेत्र 0 पेक्षा जास्त असणे आवश्यक आहे',
      'validation_soil_type_required': 'कृपया मातीचा प्रकार प्रविष्ट करा',
      'validation_soil_type_valid': 'कृपया एक वैध माती प्रकार प्रविष्ट करा',
      'validation_irrigation_required': 'कृपया सिंचन पद्धत निवडा',
      'recommendation_success': 'शिफारस यशस्वीरित्या तयार झाली!',
      'reset_form_tooltip': 'फॉर्म रीसेट करा',
      'reset_form_button': 'फॉर्म रीसेट करा',
      'not_selected': 'निवडलेले नाही',
      'acres_unit': 'एकर',
      'form_summary': 'फॉर्म सारांश:',
      'Step': 'पायरी',

      // Crop recommendation texts
      'recommendation_based_on': 'तुमच्या माहितीच्या आधारे',
      'recommendation_land_area': 'एकर सह',
      'recommendation_soil': 'माती आणि',
      'recommendation_irrigation': 'सिंचन, शिफारस केलेले पीक आहे',
      'recommendation_crop_loamy': 'गहू',
      'recommendation_crop_sandy': 'भुईमूग',
      'recommendation_crop_clay': 'भात',
      'recommendation_crop_default': 'मका',

      // Plan step tasks
      'plan_task_plow': 'चांगली भुसभुशीत जमीन मिळवण्यासाठी शेताची २-३ वेळा नांगरणी करा.',
      'plan_task_manure': 'प्रति एकर १०-१५ टन शेणखत टाका.',
      'plan_task_seeds': 'उत्तम परिणामांसाठी प्रमाणित बियाणे वापरा.',
      'plan_task_spacing': 'दोन ओळींमध्ये ३० सें.मी. अंतर ठेवा.',
      'plan_task_npk1': '२५ दिवसांनी एनपीके खताचा पहिला डोस द्या.',
      'plan_task_npk2': 'दुसरा डोस फुलोऱ्याच्या अवस्थेत द्यावा.',
    },
  };

  void setLocale(Locale locale) {
    _locale = locale;
    notifyListeners();
  }

  String translate(String key) {
    // Falls back to the key itself if a translation is not found
    return _translations[_locale.languageCode]?[key] ?? key;
  }
}

// Global instance of the service
final localizationService = LocalizationService();