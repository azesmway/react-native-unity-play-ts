import React from 'react';
import {
  requireNativeComponent,
  UIManager,
  findNodeHandle,
  Platform,
} from 'react-native';

type UnityPlayTsProps = {};

const ComponentName = 'UnityPlayTsView';

const UnityPlayTsView = requireNativeComponent<UnityPlayTsProps>(ComponentName);

export default class UnityPlayView extends React.Component<UnityPlayTsProps> {
  static defaultProps = {};

  constructor(props: any) {
    super(props);
  }

  public initUnity() {
    UIManager.dispatchViewManagerCommand(
      findNodeHandle(this),
      this.getCommand('initUnity'),
      []
    );
  }

  private getCommand(cmd: string): any {
    if (Platform.OS === 'ios') {
      return UIManager.getViewManagerConfig('UnityPlayTsView').Commands[cmd];
    } else {
      return cmd;
    }
  }

  private getProps() {
    return {
      ...this.props,
    };
  }

  public render() {
    return <UnityPlayTsView {...this.getProps()} />;
  }
}
