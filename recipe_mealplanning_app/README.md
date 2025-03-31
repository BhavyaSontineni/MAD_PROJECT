#**Nourish Note**:

Nourish Note is a mobile app developed with Flutter, aimed at simplifying meal planning, recipe discovery, and grocery list organization. With its clean and intuitive interface, it helps users efficiently manage their food-related tasks. The app enables users to plan meals for the week, build a personalized grocery list, and receive meal suggestions tailored to their dietary preferences. Nourish Note is an all-in-one solution for anyone seeking to streamline and organize their meal planning in one convenient platform.


----

##**Features**:

- **Meal Planning**: Easily plan meals for each day of the week and customize selections based on available recipes.
- **Recipe Browsing**: Browse through a variety of categorized recipes, filtered by dietary preferences (Vegetarian, Non-Vegetarian, etc.).
- **Grocery List Management**: Add, view, and delete items from a grocery list tailored to your meal plans.
- **User Profile Management**: Customize your profile for a more personalized experience.

  ---

## **Technologies Used**

- **Flutter:** A cross-platform framework that allows Nourish Note to be developed for both iOS and Android from a single codebase.
- **Dart**: The programming language behind Flutter, used for building the app's interface and managing its functionalities.
- **Material Design**: Ensures a consistent and user-friendly UI/UX experience.

---

##**Application Flow**

### **Authentication:**
- **Login and Sign-Up pages** enable users to access and create accounts securely.

### **Home Page:**

- Serves as the main navigation hub, where users can access **Today’s Meal Plan**, **Recipe List**, **Meal Planning**, and **Grocery List** tabs.
- A **Bottom Navigation Bar** is used for seamless navigation across these screens.

### **Profile Page**
Profile Page:
- Users can view and update their profile details, further customizing their experience.

  ---
  
## **Detailed Features**

1. **Home Page Navigation**
- Utilizes a Bottom Navigation Bar to access the app's main features, with a profile icon to access the Profile Page.
  
2.  **Meal Planning**
- Allows users to select meals for each day of the week.
- Stores selections in a Map for each day, which displays meal choices in a ListView.
- Meal selection is handled using a SimpleDialog that provides a list of meals to choose from.
  
3. **Grocery List Management**
- Users can add items to a grocery list using a TextField.
- Grocery items are displayed in a ListView with options to delete specific items.
- State management is used to update the list in real time.
  
4. **Recipe Filtering by Dietary Preference**
- Users can filter recipes based on dietary needs, such as Vegetarian or Non-Vegetarian.
- The selected dietary option filters the recipe list, showing only relevant results.

  ---
  
## **App Architecture**

Nourish Note is structured with scalability in mind:

- **UI Layer**: Built with Flutter widgets like Scaffold, AppBar, ListView, and BottomNavigationBar.
- **Business Logic**: Managed through stateful widgets and setState().
- **Data Layer:** Stores data locally for the meal plan and grocery list. Future updates may include database integration.

---



## **Technologies Used**

- Flutter: A cross-platform framework that allows Nourish Note to be developed for both iOS and Android from a single codebase.

- Dart: The programming language behind Flutter, used for building the app's interface and managing its functionalities.

- Material Design: Ensures a consistent and user-friendly UI/UX experience.


---

## **Conclusion**

Nourish Note is a robust and user-friendly mobile application designed to simplify meal planning and grocery list management. With a clear UI and intuitive features, it provides a strong foundation for further development, enabling users to keep their food-related activities organized and stress-free. The app highlights Flutter’s potential to create seamless, cross-platform applications and offers room for future growth with personalized meal recommendations, API integrations, and more.

Nourish Note is a mobile application built with Flutter, designed to streamline meal planning, recipe browsing, and grocery list management. It provides a clean, user-friendly interface that helps users manage their food-related activities efficiently. The app allows users to plan weekly meals, create a customized grocery list, and view personalized meal suggestions based on their dietary preferences. Nourish Note is a comprehensive tool for anyone looking to organize their meal planning in one accessible place.

---


