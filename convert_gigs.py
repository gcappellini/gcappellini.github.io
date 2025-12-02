#!/usr/bin/env python3
"""
Excel to YAML Converter for Gigs Data
Converts an Excel file with columns: Date, Band, Event, Location, City, State, Featured
to a YAML file for Jekyll static site.

Usage:
    python convert_gigs.py input_file.xlsx output_file.yml
"""

import sys
import pandas as pd
from datetime import datetime
import yaml

def convert_excel_to_yaml(excel_file, yaml_file):
    """
    Convert Excel gigs data to YAML format for Jekyll
    
    Args:
        excel_file: Path to input Excel file
        yaml_file: Path to output YAML file
    """
    
    # Read Excel file
    print(f"Reading {excel_file}...")
    df = pd.read_excel(excel_file)
    
    # Ensure required columns exist
    required_columns = ['Date', 'Band', 'Location', 'City', 'State']
    missing = [col for col in required_columns if col not in df.columns]
    if missing:
        print(f"Error: Missing required columns: {missing}")
        sys.exit(1)
    
    # Convert Date column to datetime
    df['Date'] = pd.to_datetime(df['Date'], errors='coerce')
    
    # Remove rows with invalid dates
    df = df.dropna(subset=['Date'])
    
    # Sort by date (newest first)
    df = df.sort_values('Date', ascending=False)
    
    # Convert to list of dictionaries
    gigs_list = []
    
    for _, row in df.iterrows():
        gig = {
            'date': row['Date'].strftime('%Y-%m-%d'),
            'band': str(row['Band']) if pd.notna(row['Band']) else '',
            'location': str(row['Location']) if pd.notna(row['Location']) else '',
            'city': str(row['City']) if pd.notna(row['City']) else '',
            'state': str(row['State']) if pd.notna(row['State']) else ''
        }
        
        # Add event name if it exists and is not empty
        if 'Event' in df.columns and pd.notna(row['Event']) and str(row['Event']).strip():
            gig['event'] = str(row['Event'])
        
        # Add featured flag if it exists and is TRUE
        if 'Featured' in df.columns and pd.notna(row['Featured']):
            featured_val = str(row['Featured']).strip().upper()
            if featured_val in ['TRUE', '1', 'YES', 'Y']:
                gig['featured'] = True
        
        gigs_list.append(gig)
    
    # Create output structure
    output_data = {'gigs': gigs_list}
    
    # Write YAML file
    print(f"Writing {yaml_file}...")
    with open(yaml_file, 'w', encoding='utf-8') as f:
        yaml.dump(output_data, f, 
                 default_flow_style=False, 
                 allow_unicode=True,
                 sort_keys=False)
    
    print(f"✓ Conversion complete!")
    print(f"  Total gigs: {len(gigs_list)}")
    print(f"  Featured gigs: {sum(1 for g in gigs_list if g.get('featured', False))}")
    
    # Show date range
    if gigs_list:
        earliest = min(g['date'] for g in gigs_list)
        latest = max(g['date'] for g in gigs_list)
        print(f"  Date range: {earliest} to {latest}")

if __name__ == "__main__":
    if len(sys.argv) != 3:
        print("Usage: python convert_gigs.py input_file.xlsx output_file.yml")
        print("\nExample:")
        print("  python convert_gigs.py my_gigs.xlsx _data/gigs.yml")
        sys.exit(1)
    
    input_file = sys.argv[1]
    output_file = sys.argv[2]
    
    try:
        convert_excel_to_yaml(input_file, output_file)
    except FileNotFoundError:
        print(f"Error: File '{input_file}' not found")
        sys.exit(1)
    except Exception as e:
        print(f"Error: {str(e)}")
        sys.exit(1)