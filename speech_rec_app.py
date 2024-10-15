import streamlit as st
import speech_recognition as sr

# Function to transcribe speech
def transcribe_speech(api, language):
    # Initialize recognizer class
    r = sr.Recognizer()

    # Reading Microphone as source
    with sr.Microphone() as source:
        st.info("Speak now...")

        # listen for speech and store in audio_text variable
        audio_text = r.listen(source)

        st.info("Transcribing...")

        try:
            if api == "Google":
                # Using Google Speech Recognition
                text = r.recognize_google(audio_text, language=language)
                return text
            elif api == "Sphinx":
                # Using CMU Sphinx (offline)
                text = r.recognize_sphinx(audio_text, language=language)
                return text
            else:
                return "Selected API is not supported."
        except sr.UnknownValueError:
            return "Sorry, I did not get that. Please try again."
        except sr.RequestError as e:
            return f"Could not request results from the API; {e}"

# Main function to run the Streamlit app
def main():
    st.title("Speech Recognition App")
    st.write("Click on the microphone to start speaking:")

    # Add options to select speech recognition API
    api = st.selectbox("Select Speech Recognition API:", ["Google", "Sphinx"])

    # Add option to select language
    language = st.text_input("Enter the language code (e.g., 'en-US' for English, 'fr-FR' for French):", "en-US")

    # Add a button to trigger speech recognition
    if st.button("Start Recording"):
        text = transcribe_speech(api, language)
        st.write("Transcription: ", text)

        # Option to save the transcribed text to a file
        if st.button("Save Transcription"):
            with open("transcription.txt", "w") as f:
                f.write(text)
            st.success("Transcription saved to 'transcription.txt'.")

if __name__ == "__main__":
    main()
