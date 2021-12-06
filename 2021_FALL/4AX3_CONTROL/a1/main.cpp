#include <stdio.h>
#include <math.h>
#include <iostream>
#include <eigen3/Eigen/Dense>
#include <bits/stdc++.h>
#include <vector>

using namespace std;
using namespace Eigen;

VectorXf comp_coeff(int n,int m);
VectorXf get_data(string filename);
VectorXf coeff_filter(VectorXf coeff, int n,  int m,  VectorXf data);
void write_data(string filename, VectorXf data);
void compute(int n, int m);

int main () {
    compute(2, 3);
    compute(2, 4);
    compute(4, 4);
    compute(4, 5);
    compute(4, 64);
    return 0;
}

void compute(int n, int m) {
    stringstream output_filename;
    output_filename << "n" << n << "_m" << m << ".dat";
    VectorXf coeffs = comp_coeff(n, m); // Get the coefficients
    if (coeffs.size() == 0 ) {
        return;
    }
    VectorXf data = get_data("data.txt"); // Get the data
    VectorXf smooth_data = coeff_filter(coeffs, n, m, data); // Smooht the data
    write_data(output_filename.str(), smooth_data); // Write the data to a file
}

VectorXf comp_coeff(int n,int m) { // n = order, m = number of datapoints

    if (m <= n) {
        cout << "n" << n << "_m" << m << ".dat -> N cannot be greater than or equal to M" << endl;
        VectorXf return_vect(0);
        return return_vect;
    }

    int cols = n + 1; // degree
    int rows = m;

    MatrixXf vander(rows, cols); // Create the vander matrix
    VectorXf coeffs(rows);

    // Set first column to 1
    int i, j = 0;
    for (i = 0;  i < rows; i++) {
        vander(i, 0) = 1;
    }

    bool is_odd = m % 2;
    int abs_end_val = is_odd ? (m - 1) / 2 : m - 1;
    int x_i;

    // Set the rest of the matrix
    for (i=0; i < rows; i++) {
        x_i = abs_end_val * -1 + i * (is_odd ? 1: 2);
        for (j=0; j < cols; j++) {
            vander(i, j) = pow(double(x_i), double(j));
        }
    }

    // Get the coefficients
    coeffs = ((vander.transpose() * vander).inverse() * vander.transpose()).row(0);
    /* std::cout << "Here are the coefficients coeffs:\n" << coeffs << std::endl; */

    return coeffs;
}

VectorXf get_data(string filename) {
    fstream file;
    string line;
    vector<float> data;
    int count = 0;

    // open file and fill vector
    file.open(filename);
    while (getline(file,line))
    {
        data.push_back(atof(line.c_str()));
        count++;
    }
    file.close();

    // Create the eigen vector
    VectorXf eigen_data = VectorXf::Map(&data[0], count);
    return eigen_data;
}

VectorXf coeff_filter(VectorXf coeffs, int n,  int m,  VectorXf data) {
    VectorXf filtered_data = data;
    bool is_odd = m % 2; // Check if odd
    int abs_end_val = is_odd ? (m - 1) / 2 : m - 1; // If even the abs end val is m-1 because jump by 2
    int window_size = is_odd ? m : m * 2 - 1; // Total window length if even is m*2-1 because of jump by 2

    VectorXf window(window_size);
    VectorXf smoothed_output(coeffs.size());

    // Format the prefix vector
    VectorXf prefix_vector(abs_end_val);
    prefix_vector << data.segment(1, abs_end_val).reverse();
    /* std::cout << "\n\nPrefix:\n" << prefix_vector << std::endl; */

    // Format the suffix vector
    VectorXf suffix_vector(abs_end_val);
    suffix_vector << data.reverse().segment(1, abs_end_val);
    /* std::cout << "\n\nSuffix:\n" << suffix_vector << std::endl; */

    // Create the full vector
    VectorXf full_vector(prefix_vector.size() + data.size() + suffix_vector.size());
    full_vector << prefix_vector, data, suffix_vector;
    /* std::cout << "\n\nFull vector start:\n" << full_vector.head(10) << std::endl; */


    for (int i = 0;  i < data.size(); i++) {
        window << full_vector.segment(i, window_size); // Create the window vector based off the full vector
        for (int j = 0; j < coeffs.size(); j++) {
            smoothed_output(j) = window(j * (is_odd ? 1 : 2)) * coeffs(j); // If even jump by 2
        }
        filtered_data(i) = smoothed_output.sum(); // Sum the entire coefficients to get the value
    }

    return filtered_data;
}

void write_data(string filename, VectorXf data) {
    ofstream file(filename.c_str());
    if (file.is_open())
    {
        file << data;
    }
    file.close();
    cout << filename << " SUCCESS" << endl;
}
