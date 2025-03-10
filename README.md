# CHU Management System - Java Project with Design Patterns

## 1. Introduction
This project aims to design and implement a management system for a University Hospital Center (CHU) using design patterns in Java. The objective is to effectively model and structure CHU El Jadida, considering buildings, staff, services, patients, and sections.

## 2. Technologies Used
- **Java EE (JEE)**: For developing the web-based application.
- **JDBC**: For managing database connections and queries.
- **Relational Database**: Designed to store and manage all CHU entities.

## 3. CHU Architecture
CHU El Jadida consists of several main entities:
- **Buildings**: Administration, laboratories, radiology, emergency, general medicine, medical specialties, surgery, etc.
- **Staff**: Director, administrators, doctors, nurses, and support staff.
- **Services**: Medical services, paramedical services, emergency, analysis, radiology, and technical services.
- **Patients**: Of all ages and types, with a unique identifier and medical status.
- **Sections**: Groups of over 100 patients assigned to doctors.

## 4. Design Patterns Used
This project implements four design patterns to ensure a robust and maintainable architecture:

### a. Singleton
- Ensures a single instance of database connection to avoid redundancies and improve efficiency.

### b. Factory Method
- Allows the creation of different types of buildings based on their categories.

### c. Composite
- Facilitates the management of a group of hospital services as a single logical unit.

### d. Mediator
- Manages interactions between department heads to coordinate CHU activities.

## 5. UML Diagrams
The following diagrams correspond to the implementation of the design patterns:

1. **Singleton Diagram**: Shows the structure and use of the single instance connection.

 ![WhatsApp Image 2025-03-09 at 12 08 56](https://github.com/user-attachments/assets/21093219-82ad-489a-89d5-5d53d4740572)

3. **Factory Method Diagram**: Describes the dynamic creation of buildings.

   ![WhatsApp Image 2025-03-09 at 12 08 55 (1)](https://github.com/user-attachments/assets/e67c5be1-f730-49fc-a994-ad6c4ac7662e)

5. **Composite Diagram**: Demonstrates how services are grouped into a single unit.

   ![WhatsApp Image 2025-03-09 at 12 08 55 (2)](https://github.com/user-attachments/assets/ee7016d8-776a-440d-b341-1d8498317783)

6. **Mediator Diagram**: Explains the interactions between department heads.

   ![WhatsApp Image 2025-03-09 at 12 08 55](https://github.com/user-attachments/assets/bbb3ac85-bbae-43d5-bd74-c7dfed394699)


## 6. User Interface
   **MediBook Interface**
   
   ![image](https://github.com/user-attachments/assets/d60a21e6-d21b-4c8b-bdfd-8332aef2f98e)
   **Login Admin**
   
   ![image](https://github.com/user-attachments/assets/ea1ab8b7-1b74-4996-a5ee-a252ea67f646)
  **Admin Dashboard**

  ![image](https://github.com/user-attachments/assets/ba4f8660-1b11-4895-b834-ff06a61890de)
  **Appointment List Interface**
   ![image](https://github.com/user-attachments/assets/a82ae5b3-fab1-486f-830d-a38666383b7a)
 **Building List Interface and USING CRUD (CREATE WITH FACTORY METHOD ),UPDAT,READ,DELETe)**
  ![image](https://github.com/user-attachments/assets/71258903-6ce5-452f-9a27-edf38a0bb5f8)
 **add Building**
 ![image](https://github.com/user-attachments/assets/ae5779aa-0f65-4e42-87bf-d4d081673d35)
**interface service group and service using Composite**
 _service group_
 
![image](https://github.com/user-attachments/assets/485bbd5e-efb3-4784-a6fb-70565a684307)

_service_

![image](https://github.com/user-attachments/assets/cd03ad47-b935-4a1c-a311-0a23185175b5)

_add department head and service_

![image](https://github.com/user-attachments/assets/53cda302-9915-4a1b-ac37-349e7b8dfcc2)
![image](https://github.com/user-attachments/assets/29923d64-0820-4c51-a530-a1720414aa19)
**login department head**

![image](https://github.com/user-attachments/assets/b6a0ae1b-3e1a-4e4d-b609-690997ca49ac)

_department head dachbord use Mediator_

![image](https://github.com/user-attachments/assets/031e5ae2-797d-49ea-a0ea-dfe5279e88a8)

## 7. Conclusion
This project applies several software design concepts using Java EE and advanced design patterns. It ensures an efficient and structured management of CHU El Jadida.

---
**Good luck!**

