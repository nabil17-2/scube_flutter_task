class EnergyData {
  final String label;
  final double value;
  final double percentage;
  final double cost;

  EnergyData({
    required this.label,
    required this.value,
    required this.percentage,
    required this.cost,
  });
}

class DashboardData {
  final double totalPower;
  final String energyPerSqft;
  final List<EnergyData> activeData;
  final List<EnergyData> inactiveData;

  DashboardData({
    required this.totalPower,
    required this.energyPerSqft,
    required this.activeData,
    required this.inactiveData,
  });
}