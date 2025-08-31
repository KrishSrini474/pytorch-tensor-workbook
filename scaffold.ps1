# Scaffold for PyTorch Tensor Workbook
# Run: powershell -ExecutionPolicy Bypass -File scaffold.ps1

$root = "pytorch-tensor-workbook"
New-Item -ItemType Directory -Force -Path $root

# Root files
New-Item -ItemType File -Force -Path "$root\README.md"
Set-Content "$root\README.md" "# PyTorch Tensor Practice Workbook"

"torch`nnumpy" | Out-File "$root\requirements.txt" -Encoding UTF8
".ipynb_checkpoints/`n__pycache__/`n*.pt" | Out-File "$root\.gitignore" -Encoding UTF8

# Define levels with exercises
$levels = @{
  "level01_basics_creation"      = @("ex01_scalar_tensor.py","ex02_vector_index.py","ex03_matrix_shape_strides.py","ex04_zeros_3x3.py","ex05_ones_2x2.py","ex06_linspace_0_1_10.py")
  "level02_metadata"             = @("ex07_print_metadata.py","ex08_storage_pointer_slices.py")
  "level03_indexing_slicing"     = @("ex09_slice_middle.py","ex10_extract_column.py","ex11_reverse_1d.py")
  "level04_reshaping_views"      = @("ex12_reshape_3x4.py","ex13_transpose_strides.py","ex14_view_vs_clone.py")
  "level05_math_ops"             = @("ex15_vector_ops_and_matmul.py","ex16_sqrt_elementwise.py","ex17_exp_log.py")
  "level06_broadcasting"         = @("ex18_row_plus_col.py","ex19_outer_multiply.py")
  "level07_reductions"           = @("ex20_basic_reductions.py","ex21_colwise_sum.py","ex22_rowwise_max.py")
  "level08_autograd"             = @("ex23_scalar_grad.py","ex24_vector_sum_grad.py")
  "level09_device_management"    = @("ex25_move_to_gpu.py","ex26_gpu_add_then_cpu.py")
  "level10_inplace_ops"          = @("ex27_add_inplace.py","ex28_row_normalize_inplace.py")
  "level11_random"               = @("ex29_randn_2x3.py","ex30_randint_0_9_3x3.py")
  "level12_boolean_compare"      = @("ex31_greater_than.py","ex32_all_positive.py","ex33_any_negative.py")
  "level13_sharing_cloning"      = @("ex34_transpose_shares_storage.py","ex35_clone_not_shared.py")
  "level14_io"                   = @("ex36_save_load_tensor.py")
  "level15_numpy_interop"        = @("ex37_from_numpy_shares.py","ex38_to_numpy_view.py")
  "level16_stack_concat"         = @("ex39_concat_1d.py","ex40_stack_2d.py")
}

# Create levels and exercises
foreach ($level in $levels.Keys) {
    $path = "$root\levels\$level"
    New-Item -ItemType Directory -Force -Path $path
    New-Item -ItemType File -Force -Path "$path\README.md" | Out-Null
    foreach ($file in $levels[$level]) {
        New-Item -ItemType File -Force -Path "$path\$file" | Out-Null
        Add-Content "$path\$file" "import torch`n`ndef main():`n    # TODO: implement $file`n    pass`n`nif __name__ == '__main__':`n    main()"
    }
}
Write-Host "Scaffold created in $root"
