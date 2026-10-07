from reportlab.lib.pagesizes import A4
from reportlab.platypus import SimpleDocTemplate, Paragraph, Spacer, Table, TableStyle, PageBreak, Image
from reportlab.lib import colors
from reportlab.lib.styles import getSampleStyleSheet, ParagraphStyle
from reportlab.lib.enums import TA_CENTER
from reportlab.lib.units import inch
import os

OUT = "docs/project_report.pdf"

styles = getSampleStyleSheet()
styles.add(ParagraphStyle(name="TitleCenter", parent=styles["Title"], alignment=TA_CENTER, fontSize=20, leading=25))
styles.add(ParagraphStyle(name="SubCenter", parent=styles["Normal"], alignment=TA_CENTER, fontSize=11, leading=16))
styles.add(ParagraphStyle(name="Heading", parent=styles["Heading2"], fontSize=14, leading=18, spaceBefore=12, spaceAfter=7))
styles.add(ParagraphStyle(name="Body", parent=styles["BodyText"], fontSize=9.5, leading=14, spaceAfter=7))

doc = SimpleDocTemplate(
    OUT, pagesize=A4,
    rightMargin=45, leftMargin=45, topMargin=45, bottomMargin=45
)

story = []

# Title
story += [
    Spacer(1, 40),
    Paragraph("4-BIT ALU — RTL TO GDSII", styles["TitleCenter"]),
    Spacer(1, 12),
    Paragraph("Implementation using Verilog, OpenLane and Sky130", styles["SubCenter"]),
    Spacer(1, 20),
    Paragraph("PROJECT REPORT", styles["TitleCenter"]),
    Spacer(1, 30),
    Paragraph("<b>Design:</b> 4-bit Combinational Arithmetic Logic Unit", styles["SubCenter"]),
    Paragraph("<b>Technology:</b> Sky130", styles["SubCenter"]),
    Paragraph("<b>Physical Design Flow:</b> OpenLane v1.0.2", styles["SubCenter"]),
    Spacer(1, 80),
    Paragraph("RTL Design • Simulation • Synthesis • Floorplanning • Placement • Routing • Signoff", styles["SubCenter"]),
    PageBreak()
]

def heading(t):
    story.append(Paragraph(t, styles["Heading"]))

def body(t):
    story.append(Paragraph(t, styles["Body"]))

heading("1. Abstract")
body("This project implements a 4-bit combinational Arithmetic Logic Unit (ALU) using Verilog HDL and takes the design through a complete RTL-to-GDSII physical-design flow. The ALU supports four operations: addition, subtraction, bitwise AND and bitwise OR. RTL functionality was verified through simulation and waveform analysis. The design was synthesized and physically implemented using OpenLane with the Sky130 technology. The final flow completed routing, timing analysis and signoff checks, producing a valid GDSII layout.")

heading("2. Objectives")
for x in [
    "Design a compact 4-bit combinational ALU using Verilog HDL.",
    "Verify all supported ALU operations through RTL simulation.",
    "Perform synthesis using an ASIC-oriented flow.",
    "Implement floorplanning, IO placement, placement and routing.",
    "Analyze timing and power results.",
    "Perform DRC and LVS signoff checks.",
    "Generate final GDSII, LEF and SPICE outputs."
]:
    body("• " + x)

heading("3. ALU Architecture")
body("The ALU accepts two 4-bit operands A and B and a 2-bit ALU_Sel control signal. The selected operation produces a 4-bit output Y. Because the design is combinational, there is no clock input.")

data = [
    ["ALU_Sel", "Operation", "Function"],
    ["00", "ADD", "Y = A + B"],
    ["01", "SUB", "Y = A - B"],
    ["10", "AND", "Y = A & B"],
    ["11", "OR",  "Y = A | B"]
]
tbl = Table(data, colWidths=[1.1*inch, 1.3*inch, 2.2*inch])
tbl.setStyle(TableStyle([
    ("BACKGROUND",(0,0),(-1,0),colors.lightgrey),
    ("GRID",(0,0),(-1,-1),0.5,colors.grey),
    ("FONTNAME",(0,0),(-1,0),"Helvetica-Bold"),
    ("ALIGN",(0,0),(-1,-1),"CENTER"),
    ("FONTSIZE",(0,0),(-1,-1),9),
    ("VALIGN",(0,0),(-1,-1),"MIDDLE"),
]))
story.append(tbl)
story.append(Spacer(1, 10))

heading("4. RTL Design")
body("The ALU was described using a Verilog always block with a case statement. The ALU_Sel input determines which arithmetic or bitwise operation is applied to A and B. The source RTL is available in rtl/alu_4bit.v in the project repository.")

heading("5. RTL Simulation and Verification")
body("The testbench applies representative operand and control combinations for all four ALU operations. Simulation was performed using Icarus Verilog and the resulting VCD waveform was inspected using GTKWave. The observed results included A=5, B=3: ADD produced 8, SUB produced 2, AND produced 1 and OR produced 7.")

heading("6. RTL-to-GDSII Flow")
body("The physical-design flow was performed using OpenLane v1.0.2 and the Sky130 PDK. The major stages were synthesis, floorplanning, IO placement, power planning, global placement, placement optimization, detailed placement, global routing, detailed routing, timing analysis and signoff.")

flow = [
    ["RTL", "Verilog ALU"],
    ["Simulation", "Icarus Verilog / GTKWave"],
    ["Synthesis", "Logic synthesis"],
    ["Floorplan", "Core and IO planning"],
    ["Placement", "Standard-cell placement"],
    ["Routing", "Global and detailed routing"],
    ["Signoff", "STA / DRC / LVS / GDSII"]
]
ft = Table(flow, colWidths=[1.4*inch, 3.5*inch])
ft.setStyle(TableStyle([
    ("GRID",(0,0),(-1,-1),0.5,colors.grey),
    ("FONTNAME",(0,0),(0,-1),"Helvetica-Bold"),
    ("FONTSIZE",(0,0),(-1,-1),9),
    ("VALIGN",(0,0),(-1,-1),"MIDDLE"),
]))
story.append(ft)

heading("7. Physical Design Results")
results = [
    ["Parameter", "Result"],
    ["Technology", "Sky130"],
    ["OpenLane", "v1.0.2"],
    ["Standard cells", "34"],
    ["Total cell area", "335.3216 µm²"],
    ["TNS", "0.00"],
    ["WNS", "0.00"],
    ["Worst setup slack", "4.06"],
    ["Worst hold slack", "4.00"],
]
rt = Table(results, colWidths=[2.6*inch, 2.3*inch])
rt.setStyle(TableStyle([
    ("BACKGROUND",(0,0),(-1,0),colors.lightgrey),
    ("GRID",(0,0),(-1,-1),0.5,colors.grey),
    ("FONTNAME",(0,0),(-1,0),"Helvetica-Bold"),
    ("FONTSIZE",(0,0),(-1,-1),9),
]))
story.append(rt)

heading("8. Power Analysis")
power = [
    ["Power metric", "Result"],
    ["Total power", "2.07 × 10⁻⁵ W"],
    ["Internal power", "9.80 × 10⁻⁶ W"],
    ["Switching power", "1.09 × 10⁻⁵ W"],
    ["Leakage power", "2.01 × 10⁻¹⁰ W"],
]
pt = Table(power, colWidths=[2.6*inch, 2.3*inch])
pt.setStyle(TableStyle([
    ("BACKGROUND",(0,0),(-1,0),colors.lightgrey),
    ("GRID",(0,0),(-1,-1),0.5,colors.grey),
    ("FONTNAME",(0,0),(-1,0),"Helvetica-Bold"),
    ("FONTSIZE",(0,0),(-1,-1),9),
]))
story.append(pt)

heading("9. Clocking and CTS")
body("This ALU is a purely combinational design and therefore has no clock port. Consequently, clock-tree synthesis (CTS) was disabled and is not applicable to this design. Timing analysis was still performed for the combinational paths.")

heading("10. Signoff Verification")
body("The completed flow reported zero DRC violations and zero LVS errors. The final GDSII was generated successfully. The final design outputs include GDSII, LEF and SPICE representations.")

signoff = [
    ["Check", "Result"],
    ["DRC violations", "0"],
    ["LVS errors", "0"],
    ["Final GDSII", "Generated successfully"],
]
st = Table(signoff, colWidths=[2.6*inch, 2.3*inch])
st.setStyle(TableStyle([
    ("BACKGROUND",(0,0),(-1,0),colors.lightgrey),
    ("GRID",(0,0),(-1,-1),0.5,colors.grey),
    ("FONTNAME",(0,0),(-1,0),"Helvetica-Bold"),
    ("FONTSIZE",(0,0),(-1,-1),9),
]))
story.append(st)

heading("11. Final GDSII")
body("The final physical layout was streamed to GDSII and successfully opened for inspection using KLayout. The repository contains results/final/alu_4bit.gds along with the corresponding LEF and SPICE files.")

# Add available screenshots
for fname, title in [
    ("alu_project.png", "Project Overview"),
    ("alu_simulations.png", "Simulation Evidence"),
    ("alu_waveforms.png", "Waveform Evidence"),
    ("alu_4bitphysical_layout.png", "Final Physical Layout"),
]:
    path = os.path.join("screenshots", fname)
    if os.path.exists(path):
        story.append(PageBreak())
        heading(title)
        try:
            im = Image(path)
            im._restrictSize(6.5*inch, 8.0*inch)
            story.append(im)
        except Exception:
            pass

heading("12. Key Learning Outcomes")
for x in [
    "Verilog RTL design of combinational digital logic.",
    "RTL simulation and waveform-based verification.",
    "ASIC synthesis and standard-cell implementation.",
    "Understanding of floorplanning, placement and routing.",
    "Timing and power analysis.",
    "Physical verification using DRC and LVS.",
    "Generation and inspection of a final GDSII layout."
]:
    body("• " + x)

heading("13. Conclusion")
body("The 4-bit ALU successfully progressed from Verilog RTL through simulation and the OpenLane physical-design flow to final GDSII generation using the Sky130 technology. The completed implementation contains 34 standard cells, reports zero TNS and WNS, has positive reported setup and hold slack, and passed DRC and LVS with zero violations/errors. The project demonstrates a complete introductory ASIC RTL-to-GDSII workflow.")

heading("14. Future Scope")
body("Future work includes extending the ALU with XOR, NOT, shifts, and additional arithmetic operations.")

# Build the PDF
os.makedirs("docs", exist_ok=True)
doc.build(story)
print("PDF created successfully:", OUT)
