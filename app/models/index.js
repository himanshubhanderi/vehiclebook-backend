const Sequelize = require("sequelize");
const config = require("../config/db.config");

var sequelize = new Sequelize(config.DB, config.USER, config.PASSWORD, {
  host: config.HOST,
  dialect: config.dialect,
  operatorsAliases: 0,
  logging: false,
  pool: {
    max: config.pool.max,
    min: config.pool.min,
    acquire: config.pool.acquire,
    idle: config.pool.idle,
  },
});

const db = {};

db.sequelize = sequelize;
db.user = require("./user.model")(sequelize, Sequelize);
db.Wheels = require("./wheels.model")(sequelize, Sequelize);
db.vehicleType = require("./vehicleType.model")(sequelize, Sequelize);
db.vehicleModel = require("./vehicleModel.model")(sequelize, Sequelize);

// Define associations
db.Wheels.hasOne(db.vehicleType); // Wheels has one VehicleType
db.vehicleType.belongsTo(db.Wheels); // VehicleType belongs to one Wheels

db.vehicleType.hasMany(db.vehicleModel, { as: 'vehicleModels', foreignKey: 'vehicleTypeId' }); // VehicleType has many VehicleModels
db.vehicleModel.belongsTo(db.vehicleType, { as: 'vehicleType', foreignKey: 'vehicleTypeId' }); // VehicleModel belongs to one VehicleType

db.user.belongsTo(db.Wheels, { foreignKey: 'wheelId' }); // user belongs to Wheels
db.Wheels.hasMany(db.user, { foreignKey: 'wheelId' }); // Wheels has many users

db.user.belongsTo(db.vehicleType, { foreignKey: 'vehicleTypeId' }); // user belongs to VehicleType
db.vehicleType.hasMany(db.user, { foreignKey: 'vehicleTypeId' }); // VehicleType has many users

db.user.belongsTo(db.vehicleModel, { foreignKey: 'vehicleModelId' }); // user belongs to VehicleModel
db.vehicleModel.hasMany(db.user, { foreignKey: 'vehicleModelId' }); // VehicleModel has many users

module.exports = db;


module.exports = db;