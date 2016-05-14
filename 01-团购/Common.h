//
//  Common.h
//  qzc
//
//  Created by jxm apple on 16/2/16.
//  Copyright © 2016年 xinggenji. All rights reserved.
//


#ifndef Common_h
#define Common_h

#endif /* Common_h */


//临时注释
//#ifndef DEBUG
//# define NSLog(...) NSLog(__VA_ARGS__)
//#else
//# define NSLog(...)
//#endif

//高德
#define GDAPP_KEY @"475540bd2f5d1441dd15be40ac876e2d"

//腾讯QQ、微信
#define TENCENT_APP_ID @"1105149415"
#define TENCENT_APP_ID_URLSCEME @"tencent"TENCENT_APP_ID
#define WX_APP_ID      @"wx6290c384c2864eea"
#define WX_APP_SECRET      @"7990dfa2287ec16b05e0f78f4981e03d"
//新浪微博
#define WEIBO_APP_KEY @"3502154283"
#define WEIBO_APP_KEY_URLSCEME @"wb"WEIBO_APP_KEY
#define WEIBO_REDIRECT_URL @"http://www.umeng.com/social"
//环信
#define HX_APP_ID @"1401699#huanxintest"
#define HX_LIS_ID @"huanxintest"

//测试网络接口
//#define BASE_URL @"http://192.168.3.104/app/public/api"

//服务器接口
#define BASE_URL @"http://192.168.3.222/app/public/api"

// RGB颜色设定
#define RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0f green:(g) / 255.0f blue:(b) / 255.0f alpha:1]
#define RGBA(r, g, b, a) [UIColor colorWithRed:r / 255.0f green:g / 255.0f blue:b / 255.0f alpha:a]

//颜色进制转换
#define ColorWithHexString(colorString) [UIColor colorWithHexString:(colorString)]
#define ColorAlphaWithHexString(colorString, a) [UIColor colorWithHexString:(colorString) alpha:a]

//常用颜色
//1.全局用色
#define AppMainStyleColor ColorWithHexString(@"#10aeff") //主色 系统主题色 蓝色
#define SubColor1 ColorWithHexString(@"#d9534f") //辅助色 暗红
#define SubColor2 ColorWithHexString(@"#ffbe00") //辅助色 橘黄

//2.背景用色
#define AppVCBGColor ColorWithHexString(@"#f9f9f9") //大部分背景用色，聊天、更多选项用色
#define AppVCBGColor2 ColorAlphaWithHexString(@"#fafafa", 0.95) //TabBar栏用色(95%的透明度)，输入框的框背景用色(聊天输入，搜索输入框)
#define AppNavBGColor RGB(15, 15, 15) //导航栏（Navigation）背景用色

//3.边框用色
#define BorDerColor1 ColorWithHexString(@"#dddddd") //大部分边框用色
#define BorDerColor2 ColorWithHexString(@"#eeeeee") //具体请见个人中心(我、设置)

//4.文字用色
#define TableFontColor ColorWithHexString(@"#bbbbbb") //仅TabBar用 灰色
#define PromptFontColor ColorWithHexString(@"#999999") //提示性文字(例：输入框提示文字)，内容文字
#define TitleAndTextColor ColorWithHexString(@"#333333") //标题(非导航栏)、正文
#define ImportantRemindersColor ColorWithHexString(@"#d9534f") //重要提醒
#define AppNavTextColor [UIColor whiteColor] //系统导航白色文字颜色

//屏膜宽高
#define IPHONE_WIDTH ([UIScreen mainScreen].applicationFrame.size.width)
#define IPHONE_HEIGHT ([UIScreen mainScreen].applicationFrame.size.height) //没状态栏高度

//屏幕 rect
#define SCREEN_RECT ([UIScreen mainScreen].bounds)
#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
#define CONTENT_HEIGHT (SCREEN_HEIGHT - NAVIGATION_BAR_HEIGHT - STATUS_BAR_HEIGHT)

//config
#define APPWINDOWWIDTH               [UIScreen mainScreen].bounds.size.width
#define APPWINDOWHEIGHT              [UIScreen mainScreen].bounds.size.height

//number
#define Number_Lat                0.006471
#define Number_Lng                0.005992
#define Number_Half               0.5
#define Number_Zero               0
#define Number_One                1
#define Number_Two                2
#define Number_Three              3
#define Number_Four               4
#define Number_Five               5
#define Number_Six                6
#define Number_Seven              7
#define Number_Eight              8
#define Number_Nine               9
#define Number_Ten                10
#define Number_Eleven             11
#define Number_Twelve             12
#define Number_Thirteen           13
#define Number_Fourteen           14
#define Number_Fifteen            15
#define Number_Sixteen            16
#define Number_Seventeen          17
#define Number_Eighteen           18
#define Number_Twenty             20
#define Number_Twenty_One         21
#define Number_Twenty_Two         22
#define Number_Twenty_Five        25
#define Number_Thirtyt            30
#define Number_Fourty             40
#define Number_Fifty              50
#define Number_Sixty              60
#define Number_Eighty             80
#define Number_Hundred            100
#define Number_Hundred_Forty      140
#define Number_Hundred_Eighty     180
#define Number_TwoHundred         200
#define Number_TwoHundred_Ten     210
#define Number_ThreeHundred       300
#define Number_FourHundred_One    401
#define Number_Thousand           1000

//animation 动画时长
#define Number_AnimationTime_Five 0.5f

// view alpha
#define Number_ViewAlpha_Ten      1.0f
#define Number_ViewAlpha_Five     0.5f
#define Number_ViewAlpha_Six      0.6f
#define Number_ViewAlpha_Seven    0.75f
#define Number_ViewAlpha_Three    0.3f
#define Number_ViewAlpha_Zero     0.0f
#define Number_ViewAlpha_Eight    0.8f


// 昵称字体
#define TopicCellTitleFont   [UIFont boldSystemFontOfSize:16]
#define TopicCellNameFont    [UIFont systemFontOfSize:14]
#define TopicCellContentFont [UIFont systemFontOfSize:15]
#define TopicCellDateFont    [UIFont systemFontOfSize:10]
// cell的边框宽度
#define TopicCellBorderW 10
// cell内编剧
#define CELLPADDING      16
//cell内容宽度
#define CELLCONTENTWIDTH     [UIScreen mainScreen].bounds.size.width - 32
