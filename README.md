# ketan_ramani

# Project Overview

1. By clicking on FAB (Floating Action Button) user will be able to create a new resume
2. User will see list of resumes that they have created (Name, View, Delete, Edit, Re-Order) If no resume found then it will display No data message
3. Clicking on Eye Icon user will be able to view final resume
4. Clicking on Delete Icon (User will see Adaptive Dialog / Platform Specific Dialog) to delete resume
5. Clicking on Edit Icon user will be re-direct to edit resume screen with prefill past data
6. Holding and Draging on Re-Order Icon (3 Horizontal Line) user will be able to change the resume items in the list

# Libraries Used
1. sqflite
2. path_provider

# flutter doctor command (Built on latest version of flutter)

Doctor summary (to see all details, run flutter doctor -v):
[√] Flutter (Channel stable, 2.10.5, on Microsoft Windows [Version 10.0.19042.1266], locale en-IN)
[√] Android toolchain - develop for Android devices (Android SDK version 33.0.0-rc1)
[√] Chrome - develop for the web
[X] Visual Studio - develop for Windows
    X Visual Studio not installed; this is necessary for Windows development.
      Download at https://visualstudio.microsoft.com/downloads/.
      Please install the "Desktop development with C++" workload, including all of its default components
[√] Android Studio (version 2021.1)
[√] VS Code (version 1.56.0)
[√] Connected device (4 available)
[√] HTTP Host Availability

! Doctor found issues in 1 category.

NOTE: For resume builder I've taken few fields like Name, Email, Contact No, Highest Education, Current Company, Designation, Project Title, Project Description and Implemented Field Validations