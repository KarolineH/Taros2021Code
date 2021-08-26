import json
import numpy as np
with open('run-sem_seg_final_long_validation-tag-epoch_updated_mean_io_u.json') as json_file:
    data = json.load(json_file)
val_stats = np.asarray(data)

val_meaniou = val_stats[:,2]

dummy = np.array((1,2,3,4,5))

def moving_average(inp, n=3) :
    ret = np.cumsum(inp, dtype=float)
    ret[n:] = ret[n:] - ret[:-n]
    return ret[n - 1:] / n

ma = moving_average(val_meaniou, n=30)
differences = np.diff(ma)

import pdb; pdb.set_trace()
