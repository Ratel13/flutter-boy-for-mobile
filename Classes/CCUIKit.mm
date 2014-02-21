//
//  CCUIKit.cpp
//  GreTest
//
//  Created by lyy on 13-7-23.
//
//

#include "CCUIKit.h"
#include "AppDelegate.h"
#include "AlbumTabViewController.h"
#include "FacebookInterface.h"


static CCUIKit * g_CCUIKit = NULL;
using namespace std;

CCUIKit::CCUIKit()
{
    ;
}
CCUIKit::~CCUIKit()
{
    ;
}
CCUIKit * CCUIKit::shareCCUIKit()
{
    if (!g_CCUIKit)
    {
        g_CCUIKit = new CCUIKit();
    }
    return g_CCUIKit;
}

void CCUIKit::setCCUIKit(CCUIKit * aCCUIKit)
{
    g_CCUIKit = aCCUIKit;
}

bool CCUIKit::initFacebook()
{
    return true;//[[AlbumTabViewController shareAlbumTabViewController] initFacebook];
}

bool CCUIKit::logInFacebook(int cbIndex,const char* scope)
{
    NSString * aScope = @"";
    return [[AlbumTabViewController shareAlbumTabViewController] initView] ;//[AlbumTabViewController logInFacebook:cbIndex Scope:aScope];
}
bool CCUIKit::logInFacebookCallBack(int cbIndex,const char*  logInfo)
{
    FacebookInterface::callbackJs(cbIndex,logInfo);
    
    return true;
}
