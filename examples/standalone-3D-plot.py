# /// script
# requires-python = ">=3.13"
# dependencies = [
#     "numpy",
#     "plotly",
#     "dash",
# ]
# ///

import numpy as np
import plotly.graph_objects as go
import dash
from dash import dcc, html

npoints = 2000
var = .6
dist = 2
base = 0


x = np.concatenate((np.random.normal(base,var, int(npoints/2)), np.random.normal(base+dist,var, int(npoints/2))))
y = np.concatenate((np.random.normal(base,var, int(npoints/2)), np.random.normal(base+dist,var, int(npoints/2))))
z = np.concatenate((np.random.normal(base,var, int(npoints/2)), np.random.normal(base+dist,var, int(npoints/2))))

fig = go.Figure(go.Scatter3d(x=x, y=y, z=z, mode='markers',
                             marker=dict(size=2, color=z, colorscale='icefire')))
fig.update_layout(scene=dict(xaxis_title='X', yaxis_title='Y', zaxis_title='Z'))

# run on localhost
app = dash.Dash(__name__)
app.layout = html.Div([dcc.Graph(figure=fig,
                                 style={'height': '90vh', 'width': '100%'})])
app.run(host='0.0.0.0', port=8050)
