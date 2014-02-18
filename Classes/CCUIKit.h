//
//  CCUIKit.h
//  GreTest
//
//  Created by lyy on 13-7-23.
//
//

#ifndef CCUIKit_h

#define CCUIKit_h

#include "cocos2d.h"
#include <string>
#include <map>

USING_NS_CC;

class CCUIKit : public CCLayer
{
    
public:
    
    CCUIKit();
    
    ~CCUIKit();
    
    CREATE_FUNC(CCUIKit);

    static CCUIKit * shareCCUIKit();
    void setCCUIKit(CCUIKit  * aCCUIKit);
    
    bool initFacebook();
    bool logInFacebook(int cbIndex,const char* scope);
    bool logInFacebookCallBack(int cbIndex,const char*  logInfo);
};



#endif