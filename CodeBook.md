# CodeBook for Getting and Cleaning Data Project
## Dataset Description

The dataset `tidy_data.txt` contains the average of each variable (only mean and standard deviation measurements) for each activity and each subject. This tidy dataset was created by merging and cleaning the Human Activity Recognition Using Smartphones Dataset provided by UCI.
## Variables

- `subject`: ID of the participant (Integer: 1–30)
- `activity`: Activity name performed (e.g., WALKING, SITTING)

The rest of the columns are numeric values representing the **average of each measurement** related to **mean** or **standard deviation** for each activity and subject.

Variable name structure follows this pattern:

- `TimeBodyAccelerometerMeanX`: Time-domain signal from the body’s accelerometer, mean value, X-axis
- `FrequencyBodyGyroscopeSTDZ`: Frequency-domain signal from the gyroscope, standard deviation, Z-axis

Common components in variable names:

- `Time` / `Frequency`: Time- or frequency-domain signals
- `Body` / `Gravity`: Source of signal
- `Accelerometer` / `Gyroscope`: Type of sensor
- `Mean` / `STD`: Type of measurement (mean or standard deviation)
- `X`, `Y`, `Z`: Axis direction (if applicable)


## Units

The values in the dataset are normalized and dimensionless. Therefore, no units are associated with the measurements.

## Transformations Performed

The following steps were applied to prepare the tidy dataset:

1. Merged the training and test datasets into one dataset.
2. Extracted only the measurements on the mean and standard deviation.
3. Replaced activity codes with descriptive activity names.
4. Appropriately labeled all variable names using descriptive names:
   - Replaced abbreviations (e.g., `Acc` to `Accelerometer`)
   - Replaced prefixes (`t` → `Time`, `f` → `Frequency`)
5. Created a second tidy dataset with the average of each variable for each activity and each subject.


## Summary

The final tidy dataset contains:

- 180 rows (30 subjects × 6 activities)
- 68 measurement variables + 2 identifiers (`subject`, `activity`)


