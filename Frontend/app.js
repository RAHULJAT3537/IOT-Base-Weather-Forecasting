async function fetchWeatherData() {
    document.getElementById('temperature').innerText = '25';
    document.getElementById('humidity').innerText = '60';
    document.getElementById('pressure').innerText = '1013';
    document.getElementById('timestamp').innerText = new Date().toLocaleString();
}
