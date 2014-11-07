//  ace - using MySeekbar by Sherif elKhatib for DeviceSettings in CM9
package com.cyanogenmod.settings.device;
// package mobi.sherif.seekbarthumbposition;

import android.content.Context;
import android.graphics.drawable.Drawable;
import android.util.AttributeSet;
import android.widget.SeekBar;

public class MySeekBar extends SeekBar {

    public MySeekBar(Context context) {
        super(context);
    }
    public MySeekBar(Context context, AttributeSet attrs) {
        super(context, attrs);
    }
    public MySeekBar(Context context, AttributeSet attrs, int defStyle) {
        super(context, attrs, defStyle);
    }

    Drawable mThumb;
    @Override
    public void setThumb(Drawable thumb) {
        super.setThumb(thumb);
        mThumb = thumb;
    }
    public Drawable getSeekBarThumb() {
        return mThumb;
    }

}
