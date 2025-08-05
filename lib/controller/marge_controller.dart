import 'package:get/get.dart';
import 'package:flutter/material.dart';

enum ConversationStep {
  initial,
  thinking,
  greeting,
  conversation,
  textInput,
  voiceInput,
}

enum InputMode { text, voice }

class ChatMessage {
  final String text;
  final bool isUser;
  final bool isTyping;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    this.isTyping = false,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();
}

class MargeController extends GetxController {
  final textController = TextEditingController();
  final scrollController = ScrollController();

  // Observable variables
  var currentStep = ConversationStep.initial.obs;
  var inputMode = InputMode.text.obs;
  var isThinking = true.obs;
  var isRecording = false.obs;
  var messages = <ChatMessage>[].obs;

  // Conversation flow data
  final List<String> margeIntroMessages = [
    "G'day buttercup.",
    "I'm Marge 👋\nYour list-maker, meal whisperer, and last-minute party planner.",
    "Need help figuring out what to make?\nI've got ideas.",
    "Planning a party or romantic dinner?\nI can handle those lists, no sweat.",
    "Got a recipe link?\nJust paste it here. I'll extract the ingredients and help you add to the list.",
    "Let's make you look like someone who has their sh*t together.",
  ];

  int currentMessageIndex = 0;

  @override
  void onInit() {
    super.onInit();
    // Initialize any required services
  }

  @override
  void onClose() {
    textController.dispose();
    scrollController.dispose();
    super.onClose();
  }

  void startConversation() {
    currentStep.value = ConversationStep.thinking;
    isThinking.value = true;

    // Simulate thinking time
    Future.delayed(Duration(milliseconds: 1000), () {
      isThinking.value = false;
      currentStep.value = ConversationStep.greeting;
      _showNextMessage();
    });
  }

  void _showNextMessage() {
    if (currentMessageIndex < margeIntroMessages.length) {
      // Add message with typing effect
      final message = ChatMessage(
        text: margeIntroMessages[currentMessageIndex],
        isUser: false,
        isTyping: true,
      );

      messages.add(message);
      _scrollToBottom();

      // Remove typing indicator and show full message
      Future.delayed(Duration(milliseconds: 800), () {
        messages[messages.length - 1] = ChatMessage(
          text: margeIntroMessages[currentMessageIndex],
          isUser: false,
          isTyping: false,
        );
        messages.refresh();
        currentMessageIndex++;

        // Show next message or enable input
        if (currentMessageIndex < margeIntroMessages.length) {
          Future.delayed(Duration(milliseconds: 1200), () {
            _showNextMessage();
          });
        } else {
          // All intro messages shown, enable input
          Future.delayed(Duration(milliseconds: 1000), () {
            currentStep.value = ConversationStep.textInput;
          });
        }
      });
    }
  }

  void sendMessage(String text) {
    if (text.trim().isEmpty) return;

    // Add user message
    messages.add(ChatMessage(text: text.trim(), isUser: true));

    // Clear input
    textController.clear();
    _scrollToBottom();

    // Simulate Marge's response
    Future.delayed(Duration(milliseconds: 500), () {
      _generateMargeResponse(text.trim());
    });
  }

  void _generateMargeResponse(String userMessage) {
    // Add typing indicator
    messages.add(
      ChatMessage(
        text: _getContextualResponse(userMessage),
        isUser: false,
        isTyping: true,
      ),
    );
    _scrollToBottom();

    // Replace with actual response
    Future.delayed(Duration(milliseconds: 1200), () {
      messages[messages.length - 1] = ChatMessage(
        text: _getContextualResponse(userMessage),
        isUser: false,
      );
      messages.refresh();

      // Randomly suggest voice mode after a few exchanges
      if (messages.length > 8 && inputMode.value == InputMode.text) {
        Future.delayed(Duration(milliseconds: 2000), () {
          _suggestVoiceMode();
        });
      }
    });
  }

  String _getContextualResponse(String userMessage) {
    final lowerMessage = userMessage.toLowerCase();

    if (lowerMessage.contains('romantic') || lowerMessage.contains('dinner')) {
      return "Ooh, bold move doing it same-day.\n\nWhat are we feeling—lazy, fancy, or \"impress them so they never leave\"?";
    } else if (lowerMessage.contains('party')) {
      return "Party planning, eh? I love the confidence. What's the occasion and how many people are we feeding?";
    } else if (lowerMessage.contains('recipe') ||
        lowerMessage.contains('http')) {
      return "Perfect! Just paste that recipe link and I'll pull out all the ingredients for you. Easy as.";
    } else if (lowerMessage.contains('help') ||
        lowerMessage.contains('ideas')) {
      return "Right, let's get you sorted. Are we talking quick weeknight dinner, weekend project, or full-blown culinary adventure?";
    } else {
      return "Got it! Tell me more about what you're thinking. I'm here to make this as painless as possible.";
    }
  }

  void _suggestVoiceMode() {
    messages.add(
      ChatMessage(
        text:
            "By the way, if typing's getting old, we can switch to voice. Just hit that mic button and spill the beans that way.",
        isUser: false,
      ),
    );
    _scrollToBottom();
  }

  void toggleInputMode() {
    inputMode.value =
        inputMode.value == InputMode.text ? InputMode.voice : InputMode.text;

    if (inputMode.value == InputMode.voice) {
      currentStep.value = ConversationStep.voiceInput;
    } else {
      currentStep.value = ConversationStep.textInput;
    }
  }

  void toggleRecording() {
    isRecording.value = !isRecording.value;

    if (isRecording.value) {
      // Start recording logic (placeholder)
      _startRecording();
    } else {
      // Stop recording logic (placeholder)
      _stopRecording();
    }
  }

  void _startRecording() {
    // Placeholder for actual voice recording implementation
    print('Started recording...');
  }

  void _stopRecording() {
    // Placeholder for actual voice recording implementation
    print('Stopped recording...');

    // Simulate voice transcription
    Future.delayed(Duration(milliseconds: 1000), () {
      // This would normally be the transcribed text
      sendMessage(
        "yeah i need help planning a very romantic dinner for my wife",
      );
    });
  }

  void _scrollToBottom() {
    Future.delayed(Duration(milliseconds: 100), () {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  // Helper method to simulate temporary thinking state
  void setThinkingState() {
    currentStep.value = ConversationStep.thinking;
    isThinking.value = true;

    Future.delayed(Duration(milliseconds: 1500), () {
      isThinking.value = false;
      currentStep.value = ConversationStep.conversation;
    });
  }
}
