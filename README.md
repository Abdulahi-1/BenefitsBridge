# Capstone Project - BenefitsBridge

Submitted by: **Abdulahi Abdi**

BenefitsBridge is an iOS app that helps users discover government assistance programs they may qualify for based on income, family status, and employment requirements. The app displays program descriptions and allows users to open each program’s official website directly in Safari.

Time spent: **8 hours spent in total**

---

## Required Features

The following **required** functionality is completed:

- [X] User can answer a short questionnaire about income, children, and employment status.
- [X] App filters and displays matching assistance programs.
- [X] Tapping on a program opens its official website in Safari.
- [X] Results screen scrolls and dynamically adjusts to device size.

---

The following **optional** features are implemented:

- [X] Filters can handle optional program requirements (e.g., some programs don’t require children or a set income).
- [X] Clean table view interface with readable descriptions.

---

The following **additional** features are implemented:

- [X] Professional struct-based data model for storing program details.
- [X] TableViewController setup for automatic delegate and datasource handling.
- [X] Logic to show all programs if no filters are applied.

---

## Video Walkthrough

https://www.loom.com/share/5275dc0230a34b80b17eec544014aa95?sid=d1985666-016f-48d7-b679-a0656da4864c

---

## Notes

The hardest challenge was understanding the difference between embedding a `UITableView` inside a `UIViewController` and using a `UITableViewController`.
At first, I mistakenly added only a `UITableViewCell` to my storyboard, which made it impossible to connect the table view properly and caused my results list to never display.

**How I overcame it:**  
I reviewed Apple’s UIKit documentation and discovered that `UITableViewController` automatically manages its own `tableView` property.
I replaced my setup with a proper `UITableViewController` and set the custom class to `ResultsViewController`.
This removed the need for manual delegate/datasource connections and fixed the scrolling issue.

**Results:**  
- Smooth, professional list display.
- Fully working program filtering and Safari linking.
- Cleaner architecture that’s easier to style and maintain.

---

## License

```
Copyright 2025 Abdulahi Abdi

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
```
