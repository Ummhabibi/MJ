import streamlit as st
import speech_recognition as sr
import nltk
from nltk.chat.util import Chat, reflections
# Define your chatbot responses
pairs = [
    ["hello", ["Hello! How can I help you today?"]],
    ["(.*) your name ?", ["My name is Chatbot."]],
    ["(.*) created you ?", ["I was created by a clever data scientist, Her name is Alli MJ!"]],
    ["how are you (.*)?", ["I'm doing great, thank you!"]],
    ["(.*) weather today ?", ["I don't have live data, but you could check a weather app!"]],
    ["tell me a joke", ["Why did the programmer quit his job? Because he didn't get arrays (a raise)!"]],
    ["(.*) your favorite color ?", ["I love blue, like the vast sky and the deep ocean."]],
    ["(.*) your favorite movie ?", ["I enjoy movies about AI, like *The Matrix*!"]],
    ["can you help me (.*)", ["I'm here to help however I can. What do you need assistance with?"]],
    ["thank you|thanks", ["You're welcome!", "Happy to help!", "Anytime!"]],
    ["(.*) favorite food ?", ["I'm a chatbot, so I don’t eat, but I imagine I'd like pizza if I could!"]],
    ["goodbye|bye", ["Goodbye! It was nice chatting with you.", "Take care!"]],
    ["what is AI ?", ["AI stands for Artificial Intelligence, and it’s all about creating machines that can think and learn!"]],
    ["(.*) (location|address) ?", ["I'm everywhere you are! I live on the internet."]],
    ["(.*) sports do you like ?", ["I'm a fan of e-sports! Watching other bots compete is fun."]],
    ["(.*) book do you recommend ?", ["I'm a fan of *The Hitchhiker's Guide to the Galaxy* — it's got some good lessons for an AI!"]],
]

# Initialize the chatbot
chatbot = Chat(pairs, reflections)
def transcribe_speech():
    recognizer = sr.Recognizer()
    with sr.Microphone() as source:
        st.info("Listening for your voice input...")
        audio = recognizer.listen(source)

    try:
        text = recognizer.recognize_google(audio)
        return text
    except sr.UnknownValueError:
        return "Sorry, I couldn't understand the audio."
    except sr.RequestError:
        return "There was an issue with the speech recognition service."

def chatbot_response(input_text):
    # Use the chatbot to generate a response
    return chatbot.respond(input_text)

def main():
    st.title("Speech-Enabled Chatbot")
    st.write("Choose an input method and start chatting!")

    # Input method selection
    input_method = st.radio("Select Input Method:", ("Text", "Speech"))

    if input_method == "Text":
        # Text input
        user_input = st.text_input("You: ", "Type your message here...")
        if st.button("Send"):
            response = chatbot_response(user_input)
            st.write("Chatbot:", response)

    elif input_method == "Speech":
        # Speech input
        if st.button("Record"):
            user_input = transcribe_speech()
            st.write("You said:", user_input)
            response = chatbot_response(user_input)
            st.write("Chatbot:", response)

if __name__ == "__main__":
    main()
