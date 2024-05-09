const userController = require("../controllers/user.controller");
const verifyToken = require("../middleware/JWTAuth");

module.exports = (app) => {
  app.get('/api/wheels',userController.getWheels);
  app.get('/api/vehicleType/:id',userController.getVehicleType);
  app.get('/api/vehicleModel/:id',userController.getVehicleModel);
  app.post('/api/vehicle/book',userController.bookVehicle);
};