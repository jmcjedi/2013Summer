package me.xiangchen.app.duetapp.reader;

import me.xiangchen.app.duetapp.AppExtension;
import me.xiangchen.technique.flipsense.xacFlipSenseFeatureMaker;
import me.xiangchen.technique.handsense.xacHandSenseFeatureMaker;
import me.xiangchen.technique.touchsense.xacTouchSenseFeatureMaker;

public class ReaderExtenstion extends AppExtension {

	@Override
	public void doResume() {
		showText("Reader");
	}
	
	@Override
	public void doAccelerometer(float[] values) {
		xacHandSenseFeatureMaker.updateWatchAccel(values);
		xacHandSenseFeatureMaker.addWatchFeatureEntry();
		
		xacTouchSenseFeatureMaker.updateWatchAccel(values);
		xacTouchSenseFeatureMaker.addWatchFeatureEntry();
		
		xacFlipSenseFeatureMaker.updateWatchAccel(values);
		xacFlipSenseFeatureMaker.addWatchFeatureEntry();
	}
}
