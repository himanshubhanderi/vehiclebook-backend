module.exports = (sequelize, Sequelize) => {
  const vehicleType = sequelize.define("vehicletype", {
    type: {
      type: Sequelize.STRING,
      allowNull: false,
    },
    wheelId: {
      type: Sequelize.INTEGER,
      allowNull: false,
    },
  });

  return vehicleType;
};
