import cv2
import streamlit as st
import numpy as np

# Load the Haar cascade for face detection
face_cascade = cv2.CascadeClassifier(r'C:\\Users\\Ummhabibi\\Documents\\Python Scripts\\haarcascade_frontalface_default.xml')

def detect_faces(color, scale_factor, min_neighbors):
    # Initialize the webcam
    cap = cv2.VideoCapture(0)

    # Create a placeholder for displaying frames
    frame_display = st.image([])

    # Create a "Stop Detection" button outside the loop
    stop_button = st.button("Stop Detection", key="stop_button")

    while True:
        # Check if the "Stop Detection" button was pressed
        if stop_button:
            break

        # Read frames from the webcam
        ret, frame = cap.read()
        if not ret:
            st.write("Failed to capture image. Exiting...")
            break

        # Convert the frames to grayscale
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)

        # Detect faces using the face cascade classifier
        faces = face_cascade.detectMultiScale(gray, scaleFactor=scale_factor, minNeighbors=min_neighbors)

        # Draw rectangles around the detected faces
        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), color, 2)

        # Convert the frame (BGR) to RGB so Streamlit can display it
        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)

        # Update the image placeholder with the new frame
        frame_display.image(rgb_frame)

    # Release the webcam
    cap.release()
    cv2.destroyAllWindows()

    # Ask the user if they want to save the last frame with detected faces
    save_image = st.checkbox("Save last captured frame with detected faces")
    if save_image:
        filename = st.text_input("Enter the filename:", "detected_faces.jpg")
        if filename:
            cv2.imwrite(filename, frame)
            st.write(f"Image saved as {filename}")

def app():
    st.title("Face Detection using Viola-Jones Algorithm")
    
    # Instructions for the user
    st.markdown("""
        **Instructions:**
        - Press the **"Detect Faces"** button to start detecting faces from your webcam.
        - Use the **color picker** to choose the color of the rectangle that will be drawn around detected faces.
        - Adjust the **Scale Factor** and **Min Neighbors** sliders to fine-tune the face detection.
        - Press the **"Stop Detection"** button to stop detection.
        - If you would like to save the image with detected faces, check the **"Save last captured frame"** box and enter a filename.
    """)

    # Color picker for rectangle color
    color = st.color_picker("Pick the color for the rectangle", "#00FF00")  # Default is green
    # Convert hex color to BGR for OpenCV
    color_rgb = tuple(int(color.lstrip('#')[i:i+2], 16) for i in (0, 2, 4))
    color_bgr = (color_rgb[2], color_rgb[1], color_rgb[0])

    # Slider for scaleFactor
    scale_factor = st.slider("Adjust the Scale Factor", 1.1, 2.0, 1.3, 0.1)

    # Slider for minNeighbors
    min_neighbors = st.slider("Adjust the Min Neighbors", 3, 10, 5)

    # Button to start face detection
    if st.button("Detect Faces", key="detect_button"):
        detect_faces(color_bgr, scale_factor, min_neighbors)

if __name__ == "__main__":
    app()
