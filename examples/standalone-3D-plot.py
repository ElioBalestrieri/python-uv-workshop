# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "numpy",
#     "plotly",
# ]
# ///

import numpy as np
import plotly.graph_objects as go

x = np.random.uniform(-10, 10, 200)
y = np.random.uniform(-10, 10, 200)
z = x + y + np.random.normal(0, 2, 200)

fig = go.Figure(go.Scatter3d(x=x, y=y, z=z, mode='markers',
                             marker=dict(size=4, color=z, colorscale='Viridis')))
fig.update_layout(scene=dict(xaxis_title='X', yaxis_title='Y', zaxis_title='Z'))
fig.show()
