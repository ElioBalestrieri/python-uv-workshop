import numpy as np
import pandas as pd
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt


def generate_data(n: int = 100, seed: int = 42) -> pd.DataFrame:
    """Simulate a simple temperature-vs-time dataset."""
    rng = np.random.default_rng(seed)
    years = np.arange(1950, 1950 + n)
    trend = 0.02 * (years - 1950)
    noise = rng.normal(0, 0.3, size=n)
    temp_anomaly = trend + noise
    return pd.DataFrame({"year": years, "anomaly": temp_anomaly})


def fit_trend(df: pd.DataFrame) -> float:
    """Fit a linear warming trend and return the slope (°C/year)."""
    X = df[["year"]].values
    y = df["anomaly"].values
    model = LinearRegression().fit(X, y)
    return model.coef_[0]


def main() -> None:
    df = generate_data()
    slope = fit_trend(df)
    print(f"Estimated warming trend: {slope * 100:.3f} °C/century")

    plt.scatter(df["year"], df["anomaly"], s=10, alpha=0.6)
    plt.xlabel("Year")
    plt.ylabel("Temperature anomaly (°C)")
    plt.title("Simulated Warming Trend")
    plt.savefig("trend.png", dpi=150)
    print("Saved figure to trend.png")


if __name__ == "__main__":
    main()
