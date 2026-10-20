# CGMFtkHistoriesExample.ipynb 使用说明

## Notebook 用途

`CGMFtkHistoriesExample.ipynb` 演示如何用 `CGMFtk.histories.Histories` 读取 CGMF 裂变历史文件，并对蒙特卡罗事件做统计分析和绘图。示例覆盖裂变碎片、中子、伽马射线、时间信息及角分布；适合作为分析 CGMF history 输出的入门范例。Notebook 中展示的数字和图形来自示例数据，不代表所有模拟的固定结果。

## 环境与输入文件

* 使用 Python 3、NumPy、Matplotlib 和 CGMFtk。CGMFtk 的安装方法见同目录 [`README.md`](README.md)：可在 `tools/` 下执行 `pip3 install .`。
* Notebook 导入 `from CGMFtk import histories as fh`，并使用 `fh.Histories(...)` 创建 history 数据对象。
* 运行前修改 notebook 中的 `workdir`、`histFile`，使其指向实际的 CGMF history 文件。示例路径是作者本机路径，需替换为自己的数据目录。
* 时间分析另需一个带伽马发射时间的 history 文件；示例将它命名为 `92235_timing.cgmf`。生成这类文件时，CGMF 运行选项需包含 `-t -1`。
* 可用 `fh.Histories(文件路径, nevents=数量)` 限制读取的裂变事件数，适合快速检查或减少绘图耗时。

## 内容概览

| 部分     | 分析内容                                   | 主要接口/示例                                                                                                            |
| ------ | -------------------------------------- | ------------------------------------------------------------------------------------------------------------------ |
| 导入与读取  | 导入依赖，读取 history 文件，查看事件与碎片数量           | `Histories`、`getNumberEvents()`、`getNumberFragments()`                                                             |
| 汇总表    | 汇总质量数、电荷数、TXE、TKE、自旋、中子和伽马统计           | `summaryTable()`                                                                                                   |
| 裂变碎片属性 | 质量数、电荷数和中子发射前后 TKE 的分布；TKE-TXE 二维相关    | `getA()`、`getZ()`、`getTKEpre()`、`getTKEpost()`、`getTXE()`                                                          |
| 相关观测量  | 平均中子数和平均 TKE 随碎片质量数的变化                 | `nubarA()`、`TKEA()`                                                                                                |
| 中子属性   | 中子多重数分布、瞬发中子谱、平均数和平均能量                 | `Pnu()`、`pfns()`、`nubartot()`、`meanNeutron...()`                                                                   |
| 伽马属性   | 伽马多重数与能谱、能量阈值影响、指定能量伽马的碎片产额、平均能量       | `Pnug()`、`pfgs()`、`nubargtot()`、`gammaSpec()`、`meanGamma...()`                                                     |
| 伽马时间信息 | 发射时间、随时间变化的多重数、时间窗内能谱、指定核素的时间演化和同质异能素比 | `getGammaAges()`、`nubarg(timeWindow=...)`、`pfgs(minTime=..., maxTime=...)`、`gammaMultiplicity()`、`isomericRatio()` |
| 角关联    | 碎片相对束流轴、中子相对束流轴，以及中子与碎片之间的角分布          | `FFangles()`、`nangles()`、`nFangles()`                                                                              |

## 运行建议

1. 在 Jupyter 环境中打开 notebook，确认当前 Python 内核能导入 CGMFtk、NumPy 和 Matplotlib。
2. 先编辑工作目录和文件名，再从头依次运行单元。Notebook 中部分分析复用前面建立的 `hist` 对象。
3. 如果只想试跑，可先用 `nevents` 限制事件数；获得正式统计时，再读取完整 history 文件。
4. 需要运行伽马时间分析时，单独确认 `timeFile` 存在且包含时间记录，然后运行对应单元。
5. 图形使用 Matplotlib 绘制，可按分析需要调整能量阈值 `Eth`、直方图 bins、时间窗口及绘图坐标范围。

## 阅读结果时的注意事项

* `nubartot()` 和 `nubar()` 分别表示每次裂变事件和每个碎片的平均中子数；伽马接口 `nubargtot()`、`nubarg()` 也有相同的事件/碎片口径区别。
* 能量阈值 `Eth` 的单位是 MeV；例如 `Eth=0.1` 表示 100 keV。比较不同阈值结果时应保持口径一致。
* notebook 注明当前示例的 history 文件没有记录裂变前中子在质心系中的能量；当前版本也只记录经过多普勒频移的实验室系伽马能量。
* 角度通常以 `cos(θ)` 表示。`nangles(lab=True)` 使用实验室系，`lab=False` 使用复合系统质心系；裂变前中子只支持实验室系角度分析。相关选项还包括 `includePrefission`、`afterEmission` 和能量阈值 `Eth`。
* 时间相关函数依赖带发射时间的输入文件；普通 history 文件不足以支持这些分析。

## 相关文件

* 英文示例：[`CGMFtkHistoriesExample.ipynb`](CGMFtkHistoriesExample.ipynb)
* 中文 notebook：[`CGMFtkHistoriesExample_中文版.ipynb`](CGMFtkHistoriesExample_中文版.ipynb)
* CGMFtk 安装及接口简介：[`README.md`](README.md)

