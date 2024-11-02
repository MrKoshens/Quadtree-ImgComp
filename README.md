# **Efficient Image Compression Using Quadtree Decomposition, Quantization, and Discrete Wavelet Transform**

Project Overview

This project implements an advanced image compression algorithm that integrates Quadtree Decomposition, Quantization, and Discrete Wavelet Transform (DWT) to enhance compression efficiency and quality beyond traditional methods like JPEG. This approach achieves high compression ratios while maintaining good image quality, making it well-suited for modern applications where storage efficiency and image fidelity are crucial.

Key Features

	•	Discrete Wavelet Transform (DWT): Decomposes the image into frequency sub-bands, isolating important features for better compression.
	•	Quadtree Decomposition: Partitions the image into adaptive blocks based on complexity, ensuring efficient compression by using smaller blocks for detailed regions and larger blocks for simpler areas.
	•	Quantization: Reduces pixel values to a limited set, minimizing unnecessary data without significantly affecting image quality.
	•	Huffman Encoding: Compresses the quantized data by optimizing pixel value encoding based on frequency, resulting in efficient data storage.

System Workflow

	1.	Apply DWT: Decomposes the image to separate high- and low-frequency components, allowing more effective handling of important features.
	2.	Quadtree Decomposition: Partitions the image into blocks, adapting to complex and simple regions for optimized compression.
	3.	Quantization: Reduces data by rounding pixel values to predefined levels.
	4.	Huffman Encoding: Further compresses the data by encoding pixel values based on their frequency, reducing storage requirements.
	5.	Reconstruction: Inverse operations restore the original image with high fidelity.

Requirements

	•	MATLAB (R2021a or later recommended)
	•	Image Processing Toolbox
	•	Wavelet Toolbox

Installation

	1.	Clone this repository:
 ```
git clone https://github.com/yourusername/Efficient-Image-Compression.git
cd Efficient-Image-Compression
```
	2.	Open MATLAB and add the repository folder to your MATLAB path:
 ```
addpath(genpath('path_to_repository'));
```

Usage
```
	1.	Place the image file in the images/ folder.
	2.	Run the main script in MATLAB to compress the image:
  	3.  	The main scripts are presentation.m that encodes and compresses the image. And the decoded_presentation.m decompresses and decodes the image.
```
Results

This algorithm outperforms traditional image compression methods such as JPEG and Run-Length Encoding, with key advantages in:

	•	Image Quality: Higher quality output with better detail preservation and fewer artifacts.
	•	Compression Efficiency: Reduced data size with optimized compression, improving storage and transmission efficiency.
	•	Performance: Faster processing times and reduced memory usage compared to standard methods.

Key performance metrics include:

	•	SSIM (Structural Similarity Index) and PSNR (Peak Signal-to-Noise Ratio): Measure image quality and accuracy of reconstruction.
	•	Compression Ratio: High compression ratio achieved without compromising essential image details.

References

	•	Said, A., & Pearlman, W. A. (1996). A new, fast, and efficient image codec based on set partitioning in hierarchical trees.
	•	Salomon, D. (2007). Data Compression: The Complete Reference.

License

This project is licensed under the MIT License.
