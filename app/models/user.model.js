// user.model.js
module.exports = (sequelize, Sequelize) => {
  const User = sequelize.define("user", {
    id: {
      type: Sequelize.INTEGER,
      primaryKey: true,
      autoIncrement: true
    },
    firstName: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    lastName: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    startDate: {
      type: Sequelize.DATEONLY,
      allowNull: false,
    },
    endDate:{
      type: Sequelize.DATEONLY,
      allowNull: false,
    },
    wheelId: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    vehicleTypeId: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
    vehicleModelId: {
      type: Sequelize.INTEGER,
      allowNull: false,
    }
  });

  return User;
};