const db = require("../models/index");
const User = db.user;
const Sequelize = require("sequelize");
const Op = Sequelize.Op;
const e = require("cors");
const fs = require("fs");
const path = require("path");
const moment = require("moment");
const Wheels = db.Wheels;
const VehicleType = db.vehicleType;
const VehicleModel = db.vehicleModel;

exports.getWheels = async (req, res) => {
  try {
    let WheelsList = await Wheels.findAll({
      raw: true,
      nest: true,
    });
    console.log(WheelsList, "----");
    if (WheelsList.length > 0) {
      // Convert the format of WheelsList array
      const formattedWheelsList = WheelsList.map((wheel) => ({
        value: wheel.id,
        label: wheel.wheelNumber,
      }));
      console.log(formattedWheelsList, "----");
      return res.status(200).send({
        WheelsList: formattedWheelsList,
        status: 200,
      });
    } else {
      return res.status(200).send({
        WheelsList: [],
        status: 200,
      });
    }
  } catch (err) {
    console.log(err, "err");
  }
};

exports.getVehicleType = async (req, res) => {
  try {
    if (!req.params.id) {
      return res.status(400).send({
        message: "please provide id",
        status: 400,
      });
    }
    let VehicleTypeList = await VehicleType.findAll({
      where: {
        wheelId: req.params.id,
      },
      raw: true,
      nest: true,
    });
    console.log(VehicleTypeList, "----");
    if (VehicleTypeList.length > 0) {
      // Convert the format of VehicleTypeList array
      const formattedVehicleList = VehicleTypeList.map((Vtype) => ({
        label: Vtype.type,
        value: Vtype.id,
      }));
      return res.status(200).send({
        vehicleTypeList: formattedVehicleList,
        status: 200,
      });
    } else {
      return res.status(200).send({
        vehicleTypeList: [],
        status: 200,
      });
    }
  } catch (err) {
    console.log(err, "err");
  }
};

exports.getVehicleModel = async (req, res) => {
  try {
    if (!req.params.id) {
      return res.status(400).send({
        message: "please provide id",
        status: 400,
      });
    }
    let VehicleModelList = await VehicleModel.findAll({
      where: {
        vehicleTypeId: req.params.id,
      },
      raw: true,
      nest: true,
    });
    console.log(VehicleModelList, "----");
    if (VehicleModelList.length > 0) {
      // Convert the format of VehicleTypeList array
      const formattedModelList = VehicleModelList.map((Vtype) => ({
        label: Vtype.model,
        value: Vtype.id,
      }));
      return res.status(200).send({
        vehicleModelList: formattedModelList,
        status: 200,
      });
    } else {
      return res.status(200).send({
        vehicleModelList: [],
        status: 200,
      });
    }
  } catch (err) {
    console.log(err, "err");
  }
};

exports.bookVehicle = async (req, res) => {
  try {
    let {
      firstName,
      lastName,
      numOfWheels,
      vehicleType,
      vehicleModel,
      dateRange,
    } = req.body;
  
    // Check if any vehicles are already booked within the specified date range and with the same vehicle type
    const existingBooking = await User.findOne({
      where: {
        vehicleTypeId: vehicleType,
        startDate: {
          [Sequelize.Op.lte]: moment(dateRange.endDate).format("YYYY-MM-DD"),
        },
        endDate: {
          [Sequelize.Op.gte]: moment(dateRange.startDate).format("YYYY-MM-DD"),
        },
      },
    });
  
    if (existingBooking) {
      return res.status(400).json({
        message: "Vehicle already booked for the specified date range.",
        status: 400,
      });
    }
  
    // If no conflicting bookings exist, create a new booking
    let bookVehicle = await User.create({
      firstName: firstName,
      lastName: lastName,
      startDate: moment(dateRange.startDate).format("YYYY-MM-DD"),
      endDate: moment(dateRange.endDate).format("YYYY-MM-DD"),
      wheelId: numOfWheels,
      vehicleTypeId: vehicleType,
      vehicleModelId: vehicleModel,
    });
  
    if (bookVehicle) {
      return res.status(201).json({
        message: "Vehicle booked successfully.",
        status: 201,
      });
    } else {
      return res.status(500).json({
        message: "Failed to book vehicle.",
        status: 500,
      });
    }
  } catch (error) {
    console.error("Error booking vehicle:", error);
    return res.status(500).json({
      message: "Internal server error.",
      status: 500,
    });
  }
};
