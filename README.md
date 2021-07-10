# A Clone of Microsoft Teams.

This is a Flutter project which uses Firebase for authentication and Web-RTC for vieo conferencing.

<!-- PROJECT LOGO -->
<br/>
<p align="center">
   <img src="./assets/images/icon.png">

   <h3 align="center">Microsoft Engage 2021 Challenge</h3>
   <p align ="center">
   <br/>
   <!-- Youtube Video Link -->
   <a href=" ">View Demo</a>
   .
   <a href=" ">Live Site</a>
   </p>
   </p>


   <!-- TABLE OF CONTENT -->
   <details open="open">
   <summary>Table of Content</summary>
   <ol>
    <li>
     <a href="#about-the-project">About The Project</a>
     <ul>
      <li><a href="#development-methodology">Development Methodology</a></li>
       </ul>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li><a href="#architecture">Architecture</a>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
        <li><a href="#running-on-local-network">Running</a>
        </li>
      </ul>
    </li>
    <li><a href="#snapshots">Snapshots</a></li>
    <li><a href="#scope">Roadmap</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgements">Acknowledgements</a></li>
  </ol>
</details>


<!-- ABOUT THE PROJECT -->
## **About the Project**
Microsoft Engage 2021 is a program created by Microsoft engineers, in association with Ace Hacker, for students to work on projects with live interaction and help from engineers and mentors at Microsoft. The challenge was to **build a teams clone** with the mandatory functionality - *a minimum of two participants should be able connect with each other to have a video conversation.* [Microsoft Engage 2021](https://microsoft.acehacker.com/engage2021/?mc_cid=51cf8705a5&mc_eid=e7a7568555#challenge)

### **Development Methodology :**
### Scrum Methodology
Scrum is an agile development methodology used in the development of software based on an iterative and incremental processes. Each iteration consists of two- to four-week sprints, where each sprint’s goal is to build the most important features first and come out with a potentially deliverable product.

### **Sprint Map**
 Below points provides insight to sprint wise progress and bugs:

- #### **Week 1** : 
    1.  Learn about developement.
    2.  Decide tech stack and architecture.
    3.  Learn flutter.
    

- #### **Week 2** : 
    1.  Work on UI part.
    2.  Research about extra feature.
    3.  Exploration about Firebase and WebRTC.
    4.  Complete Sign-in and Sign-up.
    5.  Authenticate email and password.
    #### *Bugs* : WebRTC implementation, Authentication.

- #### **Week 3** :
    1.  Add extra feature like mute, camera off, Switch camera.
    2.  Add chat feature during video call.
    3.  Implementation of WebRTC.
    4.  Exploration about Servers.
    5.  Run application on local server.
    6.  Update UI(Add splash screen, Add loading widgets).
    #### *Bugs* : Not working globally, bugs in server deployment.

- #### **Week 4** :  
    1.  Add app icon.
    2.  Server deployment on Heroku.
    3.  Global working(Testing on different networks).
    4.  Try to implement adapt feature.
    5.  Create apk file(App deployment).
    6.  Update README.
    7.  Create demo video.
    #### *Bugs* : Globally not working on some networks.

    




### **Built With**
* [Flutter](https://flutter.dev/docs/get-started/install)
* [FireBase](https://firebase.google.com/)
* [WebRTC](https://webrtc.org/)

## **Architecture :**
Clone uses Peer to Peer mesh architecture. Mesh architecture provides group video call functionality. WebRTC is used for the real time media communication between devices.WebRTC is a fully peer-to-peer technology for the real-time exchange of audio, video, and data, with one central caveat. Making this into a group call in P2P translates into a mesh network, where every WebRTC client has a peer connection opened to all other clients directly When dealing with WebRTC and indicating Peer to Peer mesh, the focus is almost always on media transport. The signaling still flows through servers as WebRTC doesn't provide  signaling which is essential for establishing connection.
<p align="center">
   <img src="./images/mesh.png">



<!-- GETTING STARTED -->
## **Getting Started**

### Prerequisites
- [Basic setup of flutter](https://flutter.dev/docs/get-started/instal)
- [Basic setup of VSCode](https://code.visualstudio.com/download)
- [Server Setup]()






### Installation

- Clone the repo
```sh
git clone https://github.com/varsha842/Teams-Clone.git
```
- Open with VSCode.

### Running on local network


1.Start  the Server(Stated in prerequisites). Refer given git repo for server setup-

Run command  in terminal
```sh
npm start
```
- Run **clone** file on Android.

## **Snapshots :**
| ![Welcome](./images/welcome.jpg) | 
|:--:| 
| Welcome Screen |

| ![Signup](./images/signup.jpg) | 
|:--:| 
| Sign-up Screen |

| ![Signin](./images/signin.jpg) | 
|:--:| 
| Sign-in Screen |

| ![Meeting](./images/meeting.jpg) | 
|:--:| 
| Meeting Screen |




<!-- ROADMAP -->
## Scope
### Features
- Connectivity  for 4-5 participants
- Allow chat during video call.
- Invite by meeting ID.
- Sign-in and sign-up authentication.
- Camera switch.


### Possible Improvements
- SFU/MCU implementation can be used to reduce dependency on download/upload speed of individual network connection.
- Clone uses publically avalible free stun/turn servers, custom and dedicated stun/turn servers can be used to improve cross network connection capabilities.
- Share screen feature.
- Share link feature can be added.

<!-- CONTACT -->
## Contact
- Gmail : varshajangir75@gmail.com
- Project : [https://github.com/varsha842/Teams-Clone](https://github.com/varsha842/Teams-Clone)

<!-- ACKNOWLEDGEMENTS -->
## Acknowledgements
- Nodemon
- sdp_transform
- uuid
- eventify














