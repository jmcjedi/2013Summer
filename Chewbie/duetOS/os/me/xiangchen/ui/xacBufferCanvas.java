package me.xiangchen.ui;

import java.util.ArrayList;

import android.content.Context;
import android.graphics.Canvas;
import android.graphics.Paint;
import android.graphics.Path;
import android.graphics.RectF;
import android.util.Log;
import android.view.View;

public class xacBufferCanvas extends View {

	public static final String LOGTAG = "DuetOS";
	ArrayList<Path> paths;
	ArrayList<RectF> rectfs;
	Paint pathPaint;
	Paint rectPaint;

	public xacBufferCanvas(Context context) {
		super(context);
		paths = new ArrayList<Path>();
		rectfs = new ArrayList<RectF>();
	}

	public void setPathPaint(Paint p) {
		pathPaint = p;
	}

	public void setRectPaint(Paint p) {
		rectPaint = p;
	}

	public void addPath(Path path) {
		paths.add(path);
	}

	public void addRect(RectF rectf) {
		rectfs.add(rectf);
	}

	public void clearRects() {
		rectfs.clear();
	}

	@Override
	public void onDraw(Canvas canvas) {
		super.onDraw(canvas);

		for (Path path : paths) {
			canvas.drawPath(path, pathPaint);
		}
	}

	@Override
	protected void onMeasure(int widthMeasureSpec, int heightMeasureSpec) {
		super.onMeasure(widthMeasureSpec, heightMeasureSpec);
		int width = MeasureSpec.getSize(widthMeasureSpec);
		int height = MeasureSpec.getSize(heightMeasureSpec);

		setMeasuredDimension(width, height);
	}

	@Override
	public void dispatchDraw(Canvas canvas) {
		super.dispatchDraw(canvas);
		// canvas.drawColor(Color.GREEN);
//		Log.d(LOGTAG, "redrawing...");
		for (Path path : paths) {
			canvas.drawPath(path, pathPaint);
		}

		if (rectfs != null) {
			for (RectF rectf : rectfs) {
				canvas.drawRect(rectf, rectPaint);
			}
		}
	}
}
