import cv2
import streamlit as st
import numpy as np
from PIL import Image

# Load the face cascade
face_cascade = cv2.CascadeClassifier(r'C:\\Users\\Ummhabibi\\Documents\\Python Scripts\\haarcascade_frontalface_default.xml')

def detect_faces():
    cap = cv2.VideoCapture(0)
    stframe = st.empty()

    # User can set parameters for detection
    scaleFactor = st.sidebar.slider('Scale Factor', 1.1, 2.0, 1.3)
    minNeighbors = st.sidebar.slider('Min Neighbors', 1, 10, 5)
    rect_color = st.sidebar.color_picker('Pick Rectangle Color', '#00FF00')
    color_rgb = tuple(int(rect_color.lstrip('#')[i:i+2], 16) for i in (0, 2, 4))
    
    while True:
        ret, frame = cap.read()
        if not ret:
            st.write("Failed to capture video")
            break

        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_cascade.detectMultiScale(gray, scaleFactor=scaleFactor, minNeighbors=minNeighbors)

        # Draw rectangles on the faces detected
        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), color_rgb, 2)

        rgb_frame = cv2.cvtColor(frame, cv2.COLOR_BGR2RGB)
        stframe.image(rgb_frame, channels="RGB")

        # Display the save button only when faces are detected
        if len(faces) > 0:
            if st.button("Save Image"):
                img_name = "detected_face.png"
                cv2.imwrite(img_name, frame)
                st.write(f"Image saved as {img_name}")
                break  # Exit loop after saving the image

        if cv2.waitKey(1) & 0xFF == ord('q'):
            break

    cap.release()
    cv2.destroyAllWindows()

def app():
    st.title("Face Detection using Viola-Jones Algorithm")
    st.write("Press the button below to start detecting faces from your webcam")
    
    # Add a button to start detecting faces
    if st.button("Start Face Detection"):
        detect_faces()

if __name__ == "__main__":
    app()
