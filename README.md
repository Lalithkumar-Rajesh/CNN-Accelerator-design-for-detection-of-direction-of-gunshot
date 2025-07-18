Our project focuses on developing a custom hardware 
accelerator to enhance the performance of a CNN-based 
gunshot classification model. The system is designed to process 
audio signals from multiple microphones, converting them into 
spectrograms for analysis. These spectrograms are then fed 
into a CNN model, which determines whether the detected 
sound is a gunshot. Once classified, the information is passed to 
a localization algorithm that analyzes the amplitude and 
determines the direction of arrival (DOA) of the gunshot.  
To achieve high efficiency, we implement an optimized CNN 
accelerator featuring a systolic array architecture, zero-sparse 
computation, and an adaptive kernel to maximize performance 
while operating within the constraints of an FPGA. Our 
approach differs from traditional spectrogram computation 
methods, introducing enhanced techniques that improve 
processing efficiency when combined with CPU and accelerator 
hardware.

Goal: The Primary goal of this research is to develop a 
FPGA-Based CNN accelerator optimized for real-time gunshot 
detection. By leveraging hardware-efficient deep learning 
techniques, the proposed system aims to achieve high-speed 
inference, reduced power consumption, and enhanced 
computational efficiency in comparison to traditional 
software-based approaches. 

Objectives: 
1. Develop a CNN-based classification model capable 
of accurately identifying gunshot sounds from spectrogram 
representations of audio signals. 
2. Implement a systolic array-based convolution 
engine to accelerate CNN computations, ensuring parallel 
processing and efficient data flow. 
3. Integrate sparse computation techniques to 
eliminate redundant calculations and optimize memory usage.  
4. Incorporate adaptive kernel selection to dynamically 
adjust processing based on input signal characteristics, 
improving accuracy and power efficiency. 
5. Design and implement the entire accelerator in 
Verilog HDL to ensure efficient FPGA deployment and 
real-time operation.

<img width="705" height="444" alt="image" src="https://github.com/user-attachments/assets/96ccb4ae-36f9-4a0e-8cec-e6380b0a46e5" />

The above depicted image is the SOC design of the complete application.

<img width="732" height="457" alt="image" src="https://github.com/user-attachments/assets/e3d34125-65c3-4cb7-97b5-5b95cee1e1f8" />

This is the flow of the application and our CNN accelerator model is used here to enhance the computational performance.


