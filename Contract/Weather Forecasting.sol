// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract WeatherForecast {
    
    struct WeatherData {
        uint256 temperature;
        uint256 humidity;
        uint256 pressure;
        uint256 timestamp;
        address sender;
    }
    
    WeatherData[] public weatherRecords;
    address public owner;
    
    event WeatherDataAdded(uint256 temperature, uint256 humidity, uint256 pressure, uint256 timestamp, address indexed sender);
    
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }
    
    constructor() {
        owner = msg.sender;
    }
    
    function addWeatherData(uint256 _temperature, uint256 _humidity, uint256 _pressure) public {
        weatherRecords.push(WeatherData({
            temperature: _temperature,
            humidity: _humidity,
            pressure: _pressure,
            timestamp: block.timestamp,
            sender: msg.sender
        }));
        
        emit WeatherDataAdded(_temperature, _humidity, _pressure, block.timestamp, msg.sender);
    }
    
    function getWeatherData(uint256 index) public view returns (uint256, uint256, uint256, uint256, address) {
        require(index < weatherRecords.length, "Invalid index");
        WeatherData memory data = weatherRecords[index];
        return (data.temperature, data.humidity, data.pressure, data.timestamp, data.sender);
    }
    
    function getLatestWeatherData() public view returns (uint256, uint256, uint256, uint256, address) {
        require(weatherRecords.length > 0, "No weather data available");
        WeatherData memory data = weatherRecords[weatherRecords.length - 1];
        return (data.temperature, data.humidity, data.pressure, data.timestamp, data.sender);
    }
}
