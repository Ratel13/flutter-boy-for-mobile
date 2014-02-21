
var MyLayer = cc.Layer.extend({
    isMouseDown:false,
    helloImg:null,
    helloLabel:null,
    circle:null,
    sprite:null,

    ctor:function() {
        this._super();
        cc.associateWithNative( this, cc.Layer );
    },

    init:function () {
        //////////////////////////////
        // 1. super init first
        this._super();
        var size = cc.Director.getInstance().getWinSize();

        var lazyLayer = cc.Layer.create();
        this.addChild(lazyLayer);

        // add "HelloWorld" splash screen"
        this.sprite = cc.Sprite.create(s_startBg);
        this.sprite.setPosition(size.width / 2, size.height / 2);
        lazyLayer.addChild(this.sprite, 0);
/*
        sys.localStorage.setItem('bestScore',0);

        sys.localStorage.setItem('secondScore',0);
    */
        var startItem = cc.MenuItemImage.create
        (
            s_startBtn1,
            s_startBtn2,
            function ()
            {
                var nextScene = cc.Scene.create();
                var nextLayer = new GameScene;
                nextScene.addChild(nextLayer);
                cc.Director.getInstance().replaceScene(cc.TransitionSlideInT.create(0.0, nextScene));
            },
            this
        );

        var menu = cc.Menu.create(startItem);
        menu.setPosition(0,0);
        this.addChild(menu, 1);
        startItem.setPosition(size.width / 2, size.height / 4);

        return true;
    },
    // a selector callback
    menuCloseCallback:function (sender) {
        cc.Director.getInstance().end();
    },
    onTouchesBegan:function (touches, event) {
        this.isMouseDown = true;
    },
    onTouchesMoved:function (touches, event) {
        if (this.isMouseDown) {
            if (touches) {
                //this.circle.setPosition(touches[0].getLocation().x, touches[0].getLocation().y);
            }
        }
    },
    onTouchesEnded:function (touches, event) {
        this.isMouseDown = false;
    },
    onTouchesCancelled:function (touches, event) {
        console.log("onTouchesCancelled");
    }
});

var MyScene = cc.Scene.extend({
    ctor:function() {
        this._super();
        cc.associateWithNative( this, cc.Scene );
    },

    onEnter:function () {
        this._super();
        var layer = new MyLayer();
        this.addChild(layer);
        layer.init();
    }
});




