module.exports = (sequelize, Sequelize) => {
    const vehicleModel = sequelize.define("vehiclemodel", {
      model: {
        type: Sequelize.STRING,
        allowNull: false,
      },
      vehicleTypeId: {
        type: Sequelize.INTEGER,
        allowNull: false,
      },
    });
  
    return vehicleModel;
  };