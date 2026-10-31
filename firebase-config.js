<script type="module">
  // Import the functions you need from the SDKs you need
  import { initializeApp } from "https://www.gstatic.com/firebasejs/13.1.0/firebase-app.js";
  import { getAnalytics } from "https://www.gstatic.com/firebasejs/13.1.0/firebase-analytics.js";
  // TODO: Add SDKs for Firebase products that you want to use
  // https://firebase.google.com/docs/web/setup#available-libraries

  // Your web app's Firebase configuration
  // For Firebase JS SDK v7.20.0 and later, measurementId is optional
  const firebaseConfig = {
    apiKey: "AIzaSyDCpsHamyZn2OkCbqnHlTf2g7kiVT1dDBs",
    authDomain: "raza-de-guerro-2026.firebaseapp.com",
    projectId: "raza-de-guerro-2026",
    storageBucket: "raza-de-guerro-2026.firebasestorage.app",
    messagingSenderId: "860453653149",
    appId: "1:860453653149:web:99a4b58fa3b7e447292274",
    measurementId: "G-ZYF8ZR2X02"
  };

  // Initialize Firebase
  const app = initializeApp(firebaseConfig);
  const analytics = getAnalytics(app);
</script>