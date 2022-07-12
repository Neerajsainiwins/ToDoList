export interface IInput {
  id?: string;
  name: string;
  label?: string;
  value?: string;
  cName?: string;
  onChange?: (e: any) => void | undefined;
  variant?: "outlined" | "filled";
  error?: any;
}
