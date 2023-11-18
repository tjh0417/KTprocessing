macro "Convert C to T" {
    // 检查当前是否有图像打开
    if (nImages == 0) {
        showMessage("Error", "No images open.");
        exit();
    }

    // 获取当前图像的信息
    Stack.getDimensions(width, height, channels, slices, frames);
    if (channels == 1) {
        showMessage("Error", "The current image does not have multiple channels.");
        exit();
    }

    // 如果图像具有多个通道，则将其转换为时间序列
    run("Properties...", "channels=1 slices=" + slices + " frames=" + frames);

    // 可选: 保存更改后的图像
    // saveAs("Tiff", "path-to-save/converted-image.tif");
}

// 运行宏
runMacro("Convert C to T");