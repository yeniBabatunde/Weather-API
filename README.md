
# **WeatherMood App** 🌤️  

## **Overview**  
**WeatherMood** is a simple iOS app that fetches real-time weather data using the **WeatherAPI** and displays it on a **single screen**. The app is built with modern iOS development practices, ensuring a **clean, testable, and user-friendly experience**.  

---

## **Features**  

### **Core Functionality**  
- **Dynamic Weather Information**:  
  Displays detailed weather information for a single saved city, including:  
  - **City Name**  
  - **Temperature**  
  - **Weather Condition** (with an icon)  
  - **Humidity** (%)  
  - **UV Index**  
  - **Feels Like Temperature**  

- **Search Bar**:  
  Allows users to query weather data for new cities.  

- **Dynamic View Management**:  
  The **Home Screen** uses an **enum-based state** to dynamically render appropriate views:  
  - **Loading**, **Search Results**, **Empty State**, or **Weather Data**.  

- **Data Persistence**:  
  Saves the selected city in **UserDefaults** and automatically reloads it on app launch.  

- **Caching**:  
  Implements `FileManager` for local caching of weather data, ensuring faster access and reducing unnecessary API calls.
  
- **Error Handling**:  
  Displays **meaningful alerts** to notify users of invalid cities, connectivity issues, or other errors.  

---

### **Bonus Functionality**  
- **Keyboard Management**:  
  Integrated **IQKeyboardManager** for a smooth user experience during text input.  
---

## **Screenshots** 📸  
**List**
<div align="center">
  <img src="https://github.com/user-attachments/assets/983a75b3-7a50-482f-8c4d-ed6b9006c562" alt="dashboard" width="200">
</div>

**Details**
<div align="center">
  <img src="https://github.com/user-attachments/assets/ee7abc7c-2835-49e4-becf-2c7175ea1fee" alt="dashboard" width="200">
</div>

**App Functionality (GIF)**
<div align="center">
  <img src="https://github.com/user-attachments/assets/c5318d9c-537c-4c32-9495-0719f1c3608f" alt="gif" width="200">
</div>

**Error Handling**
<div align="center">
  <img src="https://github.com/user-attachments/assets/a9e18a3b-a974-4d28-8136-6653c1b96952" alt="dashboard" width="200">
</div>

---

## **Tech Stack**  

- **Programming Language**: Swift  
- **Architecture**: **MVVM (Model-View-ViewModel)**  
- **Frameworks**: SwiftUI, Foundation  
- **Networking**: **URLSession**  
- **Data Parsing**: Codable  
- **State Management**: **Enum-based view state**  
- **Keyboard Handling**: **IQKeyboardManager**
- **Other Notables**: **Protocol Oriented** and **Dependency injection**  

---

## **How to Run the Project**  

1. Clone the repository or download the ZIP file:  
   ```bash
   git clone https://github.com/yeniBabatunde/Weather-API.git
   ```  
2. Open the `.xcodeproj` file in **Xcode**.  
3. Ensure your environment is set up with **Xcode 14 or later**.  
4. Build and run the app on a simulator or a physical device.  

---

## **Future Improvements**  
- Add **offline notifications** with a dismissable status bar:  
  - **Red** for offline.  
  - **Green** for back online.  

- Implement **unit tests** and **UI tests** to improve reliability.  

- Refine the UI to achieve **pixel-perfect accuracy** with the Figma design.  

---

This project demonstrates the implementation of **clean architecture**, **protocol-oriented programming**, and **scalable design**, making it both efficient and easy to maintain.  
